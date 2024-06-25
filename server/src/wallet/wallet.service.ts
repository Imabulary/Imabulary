import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma';

@Injectable()
export class WalletService {
  constructor(private readonly prisma: PrismaService) {}

  async balance(userId: string) {
    const wallet = await this.prisma.wallet.findUnique({
      where: { userId },
    });

    if (!wallet || typeof wallet.balance !== 'number') {
      throw new Error('Wallet not found or balance is not a number');
    }

    return wallet.balance;
  }
}
