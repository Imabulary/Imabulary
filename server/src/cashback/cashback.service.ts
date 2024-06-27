import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { PrismaService } from '../prisma';
import { CASHBACK_NOT_FOUND } from './utils';
import { WALLET_IS_INACTIVE, WALLET_STATUS } from 'src/wallet/utils';

@Injectable()
export class CashbackService {
  constructor(private readonly prisma: PrismaService) {}

  async collectCashback(userId: string) {
    const cashback = await this.prisma.cashback.findFirst({
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
      throw new HttpException(
        CASHBACK_NOT_FOUND,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }

    if (cashback.wallet.status === WALLET_STATUS.INACTIVE) {
      throw new HttpException(
        WALLET_IS_INACTIVE,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }

    await this.prisma.wallet.update({
      where: { id: cashback.wallet.id },
      data: {
        balance: cashback.wallet.balance + cashback.refund,
      },
    });
  }
}
