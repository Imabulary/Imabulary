import {
  applyDecorators,
  BadRequestException,
  CallHandler,
  ExecutionContext,
  Injectable,
  NestInterceptor,
  SetMetadata,
  UseInterceptors,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { Observable } from 'rxjs';
import { PrismaService } from 'src/prisma';
import {
  checkBalanceAvailability,
  deduct,
  INSUFFICIENT_FUNDS,
  validateWallet,
} from './utils';

const DEDUCT_BALANCE_KEY = 'deductBalanceKey';

export function DeductBalance(cost: number) {
  return applyDecorators(
    SetMetadata(DEDUCT_BALANCE_KEY, cost),
    UseInterceptors(DeductBalanceInterceptor),
  );
}

@Injectable()
class DeductBalanceInterceptor implements NestInterceptor {
  constructor(
    private readonly prisma: PrismaService,
    private readonly reflector: Reflector,
  ) {}

  async intercept(
    context: ExecutionContext,
    next: CallHandler,
  ): Promise<Observable<any>> {
    const request = context.switchToHttp().getRequest();
    const userId = request.user.id;
    const cost = this.reflector.get<number>(
      DEDUCT_BALANCE_KEY,
      context.getHandler(),
    );

    await this.prisma.$transaction(async (prisma) => {
      const wallet = await prisma.wallet.findUnique({
        where: { userId },
      });

      validateWallet(wallet);

      if (!checkBalanceAvailability(wallet.balance, cost)) {
        throw new BadRequestException(INSUFFICIENT_FUNDS);
      }

      await prisma.wallet.update({
        where: { userId },
        data: { balance: deduct(wallet.balance, cost) },
      });
    });

    return next.handle();
  }
}
