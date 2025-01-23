import { Test, TestingModule } from '@nestjs/testing';
import { FlashCardsService } from '../flashcards.service';
import { faker } from '@faker-js/faker';

describe('FlashCardsService', () => {
  let service: FlashCardsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [FlashCardsService],
    }).compile();

    service = module.get<FlashCardsService>(FlashCardsService);
  });

  describe('update', () => {
    it('should return a flashcard in case isTouched is falsy value', () => {
      const flashcardFixture = { id: faker.string.uuid() };

      service.findOne = jest.fn().mockResolvedValue(flashcardFixture);
    });
  });
});
