import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { PrismaService } from '../prisma';
import {
  AWARDS_IS_UNAVAILABLE,
  AWARDS_NOT_FOUND,
  AWARD_EXPIRATION_TIME,
  AWARD_IS_EXPIRED,
  DEFAULT_AWARD,
  DEFAULT_STREEK,
} from './utils';
import { Awards } from '@prisma/client';
import { MILLISECONDS_IN_HOUR, HOURS_IN_DAY } from './utils';

@Injectable()
export class DailyAwardsService {
  constructor(private readonly prisma: PrismaService) {}

  async collect(userId: string) {
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
      throw new HttpException(
        AWARDS_NOT_FOUND,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }

    const currentTime = new Date().toISOString();

    const isAwardAvailable = this.checkAwardAvailability({
      award,
      currentTime,
      pointer: HOURS_IN_DAY,
    });

    if (!isAwardAvailable) {
      throw new HttpException(
        AWARDS_IS_UNAVAILABLE,
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }

    const isAwardExpired = this.checkAwardAvailability({
      award,
      currentTime,
      pointer: AWARD_EXPIRATION_TIME,
    });

    if (isAwardExpired) {
      this.resetStreek(award.id, currentTime);
      return {
        isAwardAvailable: false,
        lastAwardedAt: currentTime,
        expirationTime: AWARD_EXPIRATION_TIME,
      };
    }

    await this.prisma.awards.update({
      where: { id: award.id },
      data: {
        lastAwardedAt: currentTime,
        streekLevel: award.streekLevel + 1,
        award: award.award + 1.0,
      },
    });

    return {
      isAwardAvailable: false,
      date: currentTime,
      expirationTime: AWARD_EXPIRATION_TIME,
    };
  }

  private async resetStreek(id: string, currentTime: string) {
    return await this.prisma.awards.update({
      where: { id },
      data: {
        streekLevel: DEFAULT_STREEK,
        award: DEFAULT_AWARD,
        lastAwardedAt: currentTime,
      },
    });
  }

  private checkAwardAvailability({
    award,
    currentTime,
    pointer,
  }: {
    award: Awards;
    currentTime: string;
    pointer: number;
  }): boolean {
    const { lastAwardedAt } = award;
    const timeDifference =
      new Date(currentTime).getTime() - new Date(lastAwardedAt).getTime();
    const hoursDifference = timeDifference / MILLISECONDS_IN_HOUR;

    return hoursDifference >= pointer;
  }
}
