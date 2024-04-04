import { Test, TestingModule } from '@nestjs/testing';
import { UsersService } from '../users.service';
import { PrismaService } from '../../prisma';
import { faker } from '@faker-js/faker';

describe('UsersService', () => {
  let service: UsersService;
  let prisma: PrismaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [UsersService, PrismaService],
    }).compile();

    service = module.get<UsersService>(UsersService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  describe('create', () => {
    it('should return the existing user', async () => {
      const userFixture = { email: faker.internet.email() };

      prisma.users.findFirst = jest.fn().mockResolvedValue(userFixture);

      const user = await service.create({
        uid: '123',
        email: userFixture.email,
      });

      expect(user).toEqual(userFixture);
    });

    it('should create a new user', async () => {
      const userFixture = { email: faker.internet.email() };

      prisma.users.findFirst = jest.fn().mockResolvedValue(null);
      prisma.users.create = jest.fn().mockResolvedValue(userFixture);

      const user = await service.create({
        uid: '123',
        email: userFixture.email,
      });

      expect(user).toEqual(userFixture);
    });
  });
});
