import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { PrismaService } from '../prisma';
import { TECHNICAL_ISSUE, WALLET_NOT_FOUND } from './utils';
@Injectable()
export class WalletService {
  constructor(private readonly prisma: PrismaService) {}

  async balance(userId: string) {
    const wallet = await this.prisma.wallet.findUnique({
      where: { userId },
    });

    if (!wallet) {
      throw new HttpException(
        WALLET_NOT_FOUND,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }

    if (typeof wallet.balance !== 'number') {
      throw new HttpException(
        TECHNICAL_ISSUE,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }

    return wallet.balance;
  }
}
