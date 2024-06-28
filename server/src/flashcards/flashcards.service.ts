import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { Filters, ServerPagination } from 'src/shared';
import { DisorganizeFlashcardsDTO, OrganizeFlashcardsDTO } from './dto';
import { StorageService } from 'src/storage/storage.service';
import { VisionService } from 'src/vision/vision.service';
import { AssistantService } from 'src/assistant/assistant.service';
import { TranslatorService } from 'src/translator/translator.service';
import { CashbackService } from 'src/cashback/cashback.service';

@Injectable()
export class FlashCardsService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly storage: StorageService,
    private readonly vision: VisionService,
    private readonly assistant: AssistantService,
    private readonly translator: TranslatorService,
    private readonly cashback: CashbackService,
  ) {}

  async scan(userId: string, fileName: string, file: Buffer) {
    const storageFile = await this.storage.upload(fileName, file);

    try {
      const imageUrl = await this.storage.getImageURL(storageFile);

      const objectOnImage = await this.vision.analyze(imageUrl);

      const relatedPhrase = await this.assistant.generatePhrase(objectOnImage);
      const explanation = await this.assistant.explain(objectOnImage);
      const speechPart = await this.assistant.speechPart(objectOnImage);

      // TODO: Take these variables from settings of user profile, once it's done
      const sourceLanguageCode = 'en-US';
      const targetLanguageCode = 'uk-UA';

      const [translatedWord, translatedPhrase, translatedExplanation] =
        await this.translator.translate(
          [objectOnImage, relatedPhrase, explanation],
          {
            sourceLanguageCode,
            targetLanguageCode,
          },
        );

      const card = await this.prisma.cards.create({
        data: {
          word: objectOnImage,
          phrase: relatedPhrase,
          speech_part: speechPart,
          translated_explanation: translatedExplanation,
          translated_phrase: translatedPhrase,
          translated_word: translatedWord,
          target_language: targetLanguageCode,
          source_language: sourceLanguageCode,
          image_url: imageUrl,
          userId,
          explanation,
        },
      });

      return {
        result: card,
      };
    } catch (error) {
      await storageFile.delete();

      throw error;
    }
  }

  async findAll(
    userId: string,
    pagination: ServerPagination,
    filters: Filters = {},
  ) {
    const [result, total] = await this.prisma.$transaction([
      this.prisma.cards.findMany({
        ...pagination,
        orderBy: { createdAt: 'desc' },
        where: { userId, ...filters },
      }),
      this.prisma.cards.count({ where: { userId, ...filters } }),
    ]);

    return {
      result,
      total,
    };
  }

  async organize(organizeFlashcardsDto: OrganizeFlashcardsDTO) {
    const { flashcardIds, setId } = organizeFlashcardsDto;

    const queries = flashcardIds.map((flashcardId) =>
      this.prisma.cardsOnSets.upsert({
        create: { setId, flashcardId },
        where: { setId_flashcardId: { setId, flashcardId } },
        update: {},
      }),
    );

    const result = await Promise.all(queries);

    return result;
  }

  async disorganize(disorganizeFlashcardsDto: DisorganizeFlashcardsDTO) {
    const { flashcardIds, setId } = disorganizeFlashcardsDto;

    await this.prisma.cardsOnSets.deleteMany({
      where: { setId, flashcardId: { in: flashcardIds } },
    });

    return true;
  }

  async createCardWithCashBack({
    objectOnImage,
    relatedPhrase,
    translatedPhrase,
    translatedWord,
    targetLanguageCode,
    sourceLanguageCode,
    imageUrl,
    userId,
  }) {
    return await this.prisma.$transaction(async (prisma) => {
      await this.cashback.collectCashback(userId);

      return await prisma.cards.create({
        data: {
          word: objectOnImage,
          phrase: relatedPhrase,
          translated_phrase: translatedPhrase,
          translated_word: translatedWord,
          target_language: targetLanguageCode,
          source_language: sourceLanguageCode,
          image_url: imageUrl,
          userId,
        },
      });
    });
  }
}
