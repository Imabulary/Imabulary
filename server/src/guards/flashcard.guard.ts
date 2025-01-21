import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { Users } from '@prisma/client';
import { FLASHCARD_DEFAULT_COST } from 'src/shared/constants';
import { WalletService } from 'src/wallet';
import { checkBalanceAvailability } from 'src/wallet/utils';
import { InsufficientFundsException } from 'src/wallet/utils/wallet.exception';
import { UNDEFINED_USER_ERROR_MESSAGE } from './utils';

@Injectable()
export class FlashcardGuard implements CanActivate {
  constructor(private readonly wallet: WalletService) {}

  async canActivate(context: ExecutionContext) {
    const request = context.switchToHttp().getRequest();
    const user: Users = request['user'];

    if (!user) {
      throw new UnauthorizedException(UNDEFINED_USER_ERROR_MESSAGE, {
        cause: { request },
      });
    }

    const wallet = await this.wallet.findOneAndValidate(user.id);

    const isEnoughOnBalance = checkBalanceAvailability(
      wallet.balance,
      FLASHCARD_DEFAULT_COST,
    );

    if (!isEnoughOnBalance) {
      throw new InsufficientFundsException(
        FLASHCARD_DEFAULT_COST,
        wallet.balance,
      );
    }

    return true;
  }
}
