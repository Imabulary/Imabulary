import {
  Injectable,
  NotFoundException,
  BadRequestException,
} from '@nestjs/common';
import { PrismaService } from '../prisma';
import {
  HOURS_IN_DAY,
  checkAwardAvailability,
  AWARDS_IS_UNAVAILABLE,
  AWARDS_NOT_FOUND,
  AWARD_EXPIRATION_TIME,
  DEFAULT_STREEK_LEVEL,
  DEFAULT_AWARD,
  DEFAULT_STREEK_COUNT,
  AWARD_PERIOD_UPDATION_IN_DAYS,
} from './utils';
import { conduct, WALLET_IS_INACTIVE, WALLET_STATUS } from 'src/wallet/utils';
import { Awards, Wallet } from '@prisma/client';

@Injectable()
export class DailyAwardsService {
  constructor(private readonly prisma: PrismaService) {}

  async checkAward(userId: string) {
    const award = await this.prisma.awards.findFirst({
      where: {
        wallet: {
          userId: userId,
        },
      },
      include: {
        wallet: true,
      },
    });

    if (!award) {
      throw new NotFoundException(AWARDS_NOT_FOUND);
    }

    if (award.wallet.status === WALLET_STATUS.INACTIVE) {
      throw new BadRequestException(WALLET_IS_INACTIVE);
    }

    const currentTime = new Date().toISOString();

    const isAwardAvailable = checkAwardAvailability({
      award,
      currentTime,
      pointer: HOURS_IN_DAY,
    });

    if (!isAwardAvailable) {
      throw new BadRequestException(AWARDS_IS_UNAVAILABLE);
    }

    const isAwardExpired = checkAwardAvailability({
      award,
      currentTime,
      pointer: AWARD_EXPIRATION_TIME,
    });

    return {
      expirationTime: AWARD_EXPIRATION_TIME,
      isAwardExpired,
      currentTime,
      award,
    };
  }

  async updateAwardTransaction(award: Awards, currentTime: string) {
    const nextStreekLevel = award.streekCount + 1;

    return await this.prisma.$transaction(async (prisma) => {
      let updatedAward: Awards & { wallet: Wallet };
      if (nextStreekLevel === AWARD_PERIOD_UPDATION_IN_DAYS) {
        updatedAward = await prisma.awards.update({
          where: { id: award.id },
          data: {
            lastAwardedAt: currentTime,
            streekLevel: award.streekLevel + 1,
            streekCount: DEFAULT_STREEK_COUNT,
            award: award.award + 1.0,
          },
          include: { wallet: true },
        });
      } else {
        updatedAward = await prisma.awards.update({
          where: { id: award.id },
          data: {
            lastAwardedAt: currentTime,
            streekCount: award.streekCount + 1,
          },
          include: { wallet: true },
        });
      }

      return await prisma.wallet.update({
        where: { id: updatedAward.walletId },
        data: {
          balance: conduct(updatedAward.wallet.balance, updatedAward.award),
        },
      });
    });
  }

  async expiredAwardTransaction(award: Awards, currentTime: string) {
    return await this.prisma.$transaction(async (prisma) => {
      const updatedAward = await prisma.awards.update({
        where: { id: award.id },
        data: {
          streekLevel: DEFAULT_STREEK_LEVEL,
          streekCount: DEFAULT_STREEK_COUNT,
          award: DEFAULT_AWARD,
          lastAwardedAt: currentTime,
        },
        include: { wallet: true },
      });

      return await prisma.wallet.update({
        where: { id: updatedAward.walletId },
        data: {
          balance: conduct(updatedAward.wallet.balance, updatedAward.award),
        },
      });
    });
  }
}
