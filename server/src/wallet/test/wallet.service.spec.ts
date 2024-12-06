import { Test, TestingModule } from '@nestjs/testing';
import { PrismaService } from '../../prisma';
import { WalletService } from '../wallet.service';

describe('WalletService', () => {
  let service: WalletService;

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
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
