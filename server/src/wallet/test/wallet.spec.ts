import { Test, TestingModule } from '@nestjs/testing';
import { WalletService } from '../wallet.service';
import { PrismaService } from '../../prisma';
import { TECHNICAL_ISSUE, WALLET_NOT_FOUND } from '../utils';

describe('WalletService', () => {
  let service: WalletService;
  let prisma: PrismaService;

  const mockPrismaService = {
    wallet: {
      findUnique: jest.fn().mockReturnValue({ balance: 100 }),
    },
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        WalletService,
        { provide: PrismaService, useValue: mockPrismaService },
      ],
    }).compile();

    service = module.get<WalletService>(WalletService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should return wallet balance', async () => {
    const balance = await service.balance('user-id');
    expect(balance).toEqual(100);
    expect(prisma.wallet.findUnique).toHaveBeenCalledWith({
      where: { userId: 'user-id' },
    });
  });

  it('should throw an error if balance is not a number', async () => {
    mockPrismaService.wallet.findUnique.mockReturnValueOnce({
      balance: 'invalid',
    });

    await expect(service.balance('user-id')).rejects.toThrow(TECHNICAL_ISSUE);
  });

  it('should throw an error if wallet is not found', async () => {
    mockPrismaService.wallet.findUnique.mockReturnValueOnce(null);

    await expect(service.balance('user-id')).rejects.toThrow(WALLET_NOT_FOUND);
  });
});
