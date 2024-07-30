import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma';
import { validateWallet } from './utils';
import { DailyAwardsService } from 'src/awards/awards.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class WalletService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly awardsService: DailyAwardsService,
  ) {}

  findOne(
    where: Prisma.WalletWhereUniqueInput,
    include?: Prisma.WalletInclude,
  ) {
    return this.prisma.wallet.findFirst({ where, include });
  }

  async findOneAndValidate(userId: string, include?: Prisma.WalletInclude) {
    const wallet = await this.findOne({ userId }, include);

    validateWallet(wallet);

    return wallet;
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
