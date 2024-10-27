import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
  NotFoundException,
  applyDecorators,
  UseInterceptors,
} from '@nestjs/common';
import { Observable } from 'rxjs';
import { PrismaService } from '../prisma';
import { CASHBACK_NOT_FOUND } from './utils';
import { validateWallet } from 'src/wallet/utils';
import { add } from 'lodash';

export function CollectCashback() {
  return applyDecorators(UseInterceptors(CashbackInterceptor));
}

@Injectable()
export class CashbackInterceptor implements NestInterceptor {
  constructor(private readonly prisma: PrismaService) {}

  async intercept(
    context: ExecutionContext,
    next: CallHandler,
  ): Promise<Observable<any>> {
    const request = context.switchToHttp().getRequest();
    const userId = request.user.id;

    await this.prisma.$transaction(async (prisma) => {
      const cashback = await prisma.cashback.findFirst({
        where: {
          wallet: {
            userId: userId,
          },
        },
        include: {
          wallet: true,
        },
      });

      if (!cashback) {
        throw new NotFoundException(CASHBACK_NOT_FOUND);
      }

      validateWallet(cashback.wallet);

      await prisma.wallet.update({
        where: { id: cashback.wallet.id },
        data: {
          balance: add(cashback.wallet.balance, cashback.refund),
        },
      });
    });

    return next.handle();
  }
}
