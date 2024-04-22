import { Test, TestingModule } from '@nestjs/testing';
import { SetsService } from '../sets.service';
import { PrismaService } from 'src/prisma';
import { faker } from '@faker-js/faker';
import { BadRequestException, NotFoundException } from '@nestjs/common';
import { SET_NOT_FOUND_ERROR_MESSAGE } from '../utils';

describe('SetsService', () => {
  let service: SetsService;
  let prisma: PrismaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [SetsService, PrismaService],
    }).compile();

    service = module.get<SetsService>(SetsService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  const mockFindOne = (value?: { name: string }) => {
    service.findOne = jest.fn().mockResolvedValue(value);
  };

  const generateFixtures = () => {
    const userId = faker.string.uuid();
    const setId = faker.string.uuid();
    const setDtoFixture = {
      name: faker.lorem.words(2),
      description: faker.lorem.paragraph(),
    };

    return { userId, setId, setDtoFixture };
  };

  describe('findOne', () => {
    it('should throw NotFoundException if desired record was not found in DB', () => {
      prisma.sets.findFirst = jest.fn().mockResolvedValue(null);

      expect(() =>
        service.findOne({ id: faker.string.uuid() }),
      ).rejects.toThrow(new NotFoundException(SET_NOT_FOUND_ERROR_MESSAGE));
    });

    it('should return set found in DB', async () => {
      const setFixture = {
        id: faker.string.uuid(),
        name: faker.lorem.words(2),
      };

      prisma.sets.findFirst = jest.fn().mockResolvedValue(setFixture);

      const result = await service.findOne({ id: setFixture.id });

      expect(result).toEqual(setFixture);
    });
  });

  describe('create', () => {
    it('should throw BadRequestException in case set with provided name already exists', () => {
      const { userId, setDtoFixture } = generateFixtures();

      mockFindOne({ name: setDtoFixture.name });

      expect(() => service.create(userId, setDtoFixture)).rejects.toThrow(
        new BadRequestException(
          `Set with the name "${setDtoFixture.name}" already exists`,
        ),
      );
    });

    it('should return newly created set', async () => {
      const { userId, setDtoFixture, setId } = generateFixtures();

      const returnValueFixture = { ...setDtoFixture, id: setId };

      mockFindOne();

      prisma.sets.create = jest.fn().mockResolvedValue(returnValueFixture);

      const result = await service.create(userId, setDtoFixture);

      expect(result).toEqual(returnValueFixture);
    });
  });

  describe('update', () => {
    it('should throw BadRequestException if user provided the name inside DTO and the set with such name already exists', () => {
      const { userId, setDtoFixture, setId } = generateFixtures();

      mockFindOne({ name: setDtoFixture.name });

      expect(() =>
        service.update(setId, userId, setDtoFixture),
      ).rejects.toThrow(
        new BadRequestException(
          `Set with the name "${setDtoFixture.name}" already exists`,
        ),
      );
    });

    it('should return updated set in case set with the provided name does not exists in DB', async () => {
      const { userId, setDtoFixture, setId } = generateFixtures();

      mockFindOne();

      const returnValueFixture = { ...setDtoFixture, id: setId };

      prisma.sets.update = jest.fn().mockResolvedValue(returnValueFixture);

      const result = await service.update(setId, userId, setDtoFixture);

      expect(result).toEqual(returnValueFixture);
    });
  });
});
