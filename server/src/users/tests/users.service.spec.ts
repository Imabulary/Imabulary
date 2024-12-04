import { Test, TestingModule } from '@nestjs/testing';
import { UsersService } from '../users.service';
import { PrismaService } from '../../prisma';
import { faker } from '@faker-js/faker';
import { WalletService } from 'src/wallet/wallet.service';
import { StorageService } from 'src/storage/storage.service';
import { FeedbackService } from 'src/feedback/feedback.service';

describe('UsersService', () => {
  let service: UsersService;
  let prisma: PrismaService;
  let wallet: WalletService;

  const getUserFixture = () => ({
    email: faker.internet.email(),
    id: faker.string.uuid(),
  });

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        UsersService,
        PrismaService,
        WalletService,
        StorageService,
        FeedbackService,
      ],
    }).compile();

    service = module.get<UsersService>(UsersService);
    prisma = module.get<PrismaService>(PrismaService);
    wallet = module.get<WalletService>(WalletService);
  });

  describe('create', () => {
    it('should return the existing user', async () => {
      const userFixture = getUserFixture();

      service.findOne = jest.fn().mockResolvedValue(userFixture);

      const user = await service.findOneOrCreate({
        uid: '123',
        email: userFixture.email,
      });

      expect(user).toEqual(userFixture);
    });

    it('should create a new user and attach wallet to them', async () => {
      const userFixture = getUserFixture();

      service.findOne = jest.fn().mockResolvedValue(null);
      wallet.create = jest.fn();
      prisma.users.create = jest.fn().mockResolvedValue(userFixture);

      const user = await service.findOneOrCreate({
        uid: '123',
        email: userFixture.email,
      });

      expect(wallet.create).toHaveBeenCalledWith(user.id);
      expect(user).toEqual(userFixture);
    });
  });
});
