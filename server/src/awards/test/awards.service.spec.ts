import { Test, TestingModule } from '@nestjs/testing';
import { DailyAwardsService } from '../awards.service';
import { PrismaService } from '../../prisma';
import { HttpException, HttpStatus, NotFoundException } from '@nestjs/common';
import {
  AWARDS_NOT_FOUND,
  checkAwardAvailability,
  MILLISECONDS_IN_HOUR,
  AWARDS_IS_UNAVAILABLE,
  HOURS_IN_DAY,
} from '../utils';
import { WALLET_IS_INACTIVE, WALLET_STATUS } from 'src/wallet/utils';

describe('DailyAwardsService', () => {
  let service: DailyAwardsService;
  let prisma: PrismaService;

  const currentTime = new Date().toISOString();

  const mockPrismaService = {
    awards: {
      findFirst: jest.fn(),
    },
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        DailyAwardsService,
        { provide: PrismaService, useValue: mockPrismaService },
      ],
    }).compile();

    service = module.get<DailyAwardsService>(DailyAwardsService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should throw an error if the wallet is inactive', async () => {
    const expectedAward = {
      id: 'award-id',
      walletId: 'wallet-id',
      lastAwardedAt: new Date().toISOString(),
      streekLevel: 1,
      streekCount: 1,
      award: 10.0,
      wallet: {
        id: 'wallet-id',
        status: WALLET_STATUS.INACTIVE,
      },
    };
    mockPrismaService.awards.findFirst.mockResolvedValue(expectedAward);

    await expect(service.checkAward('user-id')).rejects.toThrow(
      new NotFoundException({
        message: WALLET_IS_INACTIVE,
        statusCode: HttpStatus.BAD_REQUEST,
      }),
    );
    expect(prisma.awards.findFirst).toHaveBeenCalledWith({
      where: { wallet: { userId: 'user-id' } },
      include: {
        wallet: true,
      },
    });
  });

  it('should throw an error if no award is found by user ID', async () => {
    mockPrismaService.awards.findFirst.mockResolvedValue(null);

    await expect(service.checkAward('user-id')).rejects.toThrow(
      new NotFoundException(AWARDS_NOT_FOUND),
    );
  });

  it('should find an award and determine it is unavailable if checked too soon', async () => {
    const expectedAward = {
      id: 'award-id',
      walletId: 'wallet-id',
      lastAwardedAt: new Date().toISOString(),
      streekLevel: 1,
      streekCount: 1,
      award: 10.0,
      wallet: {
        id: 'wallet-id',
        status: WALLET_STATUS.ACTIVE,
      },
    };
    mockPrismaService.awards.findFirst.mockResolvedValue(expectedAward);

    const isAvailable = checkAwardAvailability({
      award: expectedAward,
      currentTime,
      pointer: 24,
    });
    expect(isAvailable).toBeFalsy();
    await expect(service.checkAward('user-id')).rejects.toThrow(
      new HttpException(
        AWARDS_IS_UNAVAILABLE,
        HttpStatus.INTERNAL_SERVER_ERROR,
      ),
    );
  });

  it('should find an award and determine it is expired if past the allowable period', async () => {
    const awardGivenLongAgo = {
      id: 'award-id',
      walletId: 'wallet-id',
      lastAwardedAt: new Date(
        Date.now() - (HOURS_IN_DAY * 2 + 1) * MILLISECONDS_IN_HOUR,
      ).toISOString(),
      streekLevel: 1,
      streekCount: 1,
      award: 10.0,
      wallet: {
        id: 'wallet-id',
        status: WALLET_STATUS.ACTIVE,
      },
    };
    mockPrismaService.awards.findFirst.mockResolvedValue(awardGivenLongAgo);

    const isExpired = checkAwardAvailability({
      award: awardGivenLongAgo,
      currentTime,
      pointer: HOURS_IN_DAY * 2,
    });
    expect(isExpired).toBeTruthy();
    await expect(service.checkAward('user-id')).resolves.toMatchObject({
      isAwardExpired: true,
    });
  });
});
