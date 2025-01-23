import { Test, TestingModule } from '@nestjs/testing';
import { FlashCardsService } from '../flashcards.service';
import { faker } from '@faker-js/faker';
import { FlashcardsRepository } from '../flashcards.repository';
import { PrismaService } from 'src/prisma';
import { StorageService } from 'src/storage/storage.service';
import { VisionService } from 'src/vision/vision.service';
import { AssistantService } from 'src/assistant/assistant.service';
import { NlpService } from 'src/nlp';
import { TranslatorService } from 'src/translator/translator.service';
import { SoundService } from 'src/sound/sound.service';
import { FeedbackService } from 'src/feedback/feedback.service';
import { QuizService } from 'src/quiz/quiz.service';

describe('FlashCardsService', () => {
  let service: FlashCardsService;
  let repository: FlashcardsRepository;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        FlashCardsService,
        FlashcardsRepository,
        PrismaService,
        StorageService,
        VisionService,
        AssistantService,
        NlpService,
        TranslatorService,
        SoundService,
        FeedbackService,
        QuizService,
      ],
    }).compile();

    service = module.get<FlashCardsService>(FlashCardsService);
    repository = module.get<FlashcardsRepository>(FlashcardsRepository);
  });

  describe('update', () => {
    it('should return a flashcard in case isTouched is falsy value', async () => {
      const userId = faker.string.uuid();
      const flashcardFixture = { id: faker.string.uuid() };

      service.findOne = jest.fn().mockResolvedValue(flashcardFixture);

      const result = await service.update(flashcardFixture.id, userId, {
        isTouched: undefined,
      });

      expect(result).toEqual(flashcardFixture);
    });

    it('should return a flashcard in case isTouched is true, but flashcard was already marked as `touched`', async () => {
      const userId = faker.string.uuid();
      const flashcardFixture = { id: faker.string.uuid(), isTouched: true }; // flashcard marked as touched

      service.findOne = jest.fn().mockResolvedValue(flashcardFixture);

      const result = await service.update(flashcardFixture.id, userId, {
        isTouched: true,
      });

      expect(result).toEqual(flashcardFixture);
    });

    it('should update a flashcard in case isTouched is true and flashcard was not marked as `touched`', async () => {
      const userId = faker.string.uuid();
      const flashcardFixture = { id: faker.string.uuid() };
      const updatedFlashcardFixture = { ...flashcardFixture, isTouched: true };

      service.findOne = jest.fn().mockResolvedValue(flashcardFixture);
      repository.update = jest.fn().mockResolvedValue(updatedFlashcardFixture);

      const result = await service.update(flashcardFixture.id, userId, {
        isTouched: true,
      });

      expect(repository.update).toHaveBeenCalled();
      expect(result).toEqual(updatedFlashcardFixture);
    });
  });
});
