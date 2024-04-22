import { PrismaService } from 'src/prisma';
import { IsRecordExistConstraint } from '../is-record-exist.decorator';
import { faker } from '@faker-js/faker';
import { Test, TestingModule } from '@nestjs/testing';

describe('IsRecordExistConstraint', () => {
  let prisma: PrismaService;
  const entity = 'sets';
  const id = faker.string.uuid();

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PrismaService],
    }).compile();

    prisma = module.get<PrismaService>(PrismaService);
  });

  it('should return false meaning that validation has failed and record does not exist', async () => {
    prisma[entity].findFirst = jest.fn().mockResolvedValue(null);

    const isRecordExistConstraint = new IsRecordExistConstraint(prisma, entity);
    const result = await isRecordExistConstraint.validate(id);

    expect(result).toBe(false);
  });

  it('should return true meaning that validation has passed and record exists', async () => {
    prisma[entity].findFirst = jest
      .fn()
      .mockResolvedValue({ name: 'Lorem Ipsum' });

    const isRecordExistConstraint = new IsRecordExistConstraint(prisma, entity);
    const result = await isRecordExistConstraint.validate(id);

    expect(result).toBe(true);
  });
});
