import { Injectable, HttpStatus, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma';
import { TECHNICAL_ISSUE, WALLET_NOT_FOUND } from './utils';
import { DailyAwardsService } from 'src/awards/awards.service';
@Injectable()
export class WalletService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly awardsService: DailyAwardsService,
  ) {}

  async balance(userId: string) {
    const wallet = await this.prisma.wallet.findUnique({
      where: { userId },
    });

    if (!wallet) {
      throw new NotFoundException(WALLET_NOT_FOUND);
    }

    if (typeof wallet.balance !== 'number') {
      throw new NotFoundException({
        message: TECHNICAL_ISSUE,
        statusCode: HttpStatus.BAD_REQUEST,
      });
    }

    return wallet.balance;
  }

  async collectAward(userId: string) {
    const { isAwardExpired, award, currentTime, expirationTime } =
      await this.awardsService.checkAward(userId);
    const updatedWallet = isAwardExpired
      ? await this.awardsService.expiredAwardTransaction(award, currentTime)
      : await this.awardsService.updateAwardTransaction(award, currentTime);

    return {
      currentBalance: updatedWallet.balance,
      lastAwardedAt: currentTime,
      nextAward: award.award,
      expirationTime,
    };
  }
}
