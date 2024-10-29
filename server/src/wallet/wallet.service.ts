import { BadRequestException, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { add, subtract } from 'lodash';
import { DailyAwardsService } from 'src/awards/awards.service';
import { PrismaService } from '../prisma';
import {
  checkBalanceAvailability,
  INSUFFICIENT_FUNDS,
  validateWallet,
} from './utils';

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

  async manage(userId: string, cost: number, operation: 'add' | 'subtract') {
    const operaions = { add, subtract };

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
        data: { balance: operaions[operation](wallet.balance, cost) },
      });
    });
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
