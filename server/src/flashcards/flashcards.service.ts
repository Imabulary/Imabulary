import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { Filters, ServerPagination } from 'src/shared';
import { DisorganizeFlashcardsDTO, OrganizeFlashcardsDTO } from './dto';
import { StorageService } from 'src/storage/storage.service';
import { VisionService } from 'src/vision/vision.service';
import { AssistantService } from 'src/assistant/assistant.service';
import { TranslatorService } from 'src/translator/translator.service';

@Injectable()
export class FlashCardsService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly storage: StorageService,
    private readonly vision: VisionService,
    private readonly assistant: AssistantService,
    private readonly translator: TranslatorService,
  ) {}

  async scan(userId: string, fileName: string, file: Buffer) {
    const imageUrl = await this.storage.upload(fileName, file);

    const objectOnImage = await this.vision.analyze(imageUrl);

    const relatedPhrase = await this.assistant.generatePhrase(objectOnImage);

    // TODO: Take these variables from settings of user profile, once it's done
    const sourceLanguageCode = 'en-US';
    const targetLanguageCode = 'uk-UA';

    const [translatedWord, translatedPhrase] = await this.translator.translate(
      [objectOnImage, relatedPhrase],
      { sourceLanguageCode, targetLanguageCode },
    );

    const card = await this.prisma.cards.create({
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

    return {
      result: card,
    };
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
}
