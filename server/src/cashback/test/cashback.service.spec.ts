import { Test, TestingModule } from '@nestjs/testing';
import { CashbackService } from '../cashback.service';
import { PrismaService } from 'src/prisma';
import { HttpStatus, NotFoundException } from '@nestjs/common';
import { CASHBACK_NOT_FOUND } from '../utils';
import { WALLET_IS_INACTIVE, WALLET_STATUS } from 'src/wallet/utils';

describe('CashbackService', () => {
  let service: CashbackService;

  const mockPrismaService = {
    cashback: {
      findFirst: jest.fn(),
    },
    wallet: {
      update: jest.fn(),
    },
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        CashbackService,
        { provide: PrismaService, useValue: mockPrismaService },
      ],
    }).compile();

    service = module.get<CashbackService>(CashbackService);
  });

  it('should throw an error if cashback is not found', async () => {
    mockPrismaService.cashback.findFirst.mockResolvedValue(null);

    await expect(service.collectCashback('some-user-id')).rejects.toThrow(
      new NotFoundException(CASHBACK_NOT_FOUND),
    );
  });

  it('should throw an error if wallet is inactive', async () => {
    mockPrismaService.cashback.findFirst.mockResolvedValue({
      wallet: { status: WALLET_STATUS.INACTIVE },
    });

    await expect(service.collectCashback('some-user-id')).rejects.toThrow(
      new NotFoundException({
        message: WALLET_IS_INACTIVE,
        statusCode: HttpStatus.BAD_REQUEST,
      }),
    );
  });

  it('should successfully collect cashback and update the wallet balance', async () => {
    const mockCashback = {
      wallet: {
        id: 'wallet-id',
        status: WALLET_STATUS.ACTIVE,
        balance: 100,
      },
      refund: 0.1,
    };

    mockPrismaService.cashback.findFirst.mockResolvedValue(mockCashback);
    mockPrismaService.wallet.update.mockResolvedValue({
      id: 'wallet-id',
      balance: 100.1,
    });

    await service.collectCashback('some-user-id');

    expect(mockPrismaService.wallet.update).toHaveBeenCalledWith({
      where: { id: mockCashback.wallet.id },
      data: {
        balance: mockCashback.wallet.balance + mockCashback.refund,
      },
    });
  });
});
