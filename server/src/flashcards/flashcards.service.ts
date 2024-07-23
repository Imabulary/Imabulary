import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma';
import { Filters, ServerPagination } from 'src/shared';
import {
  DisorganizeFlashcardsDTO,
  OrganizeFlashcardsDTO,
  DislikeFlashcardDto,
  LikeFlashcardDto,
} from './dto';
import { StorageService } from 'src/storage/storage.service';
import { VisionService } from 'src/vision/vision.service';
import { AssistantService } from 'src/assistant/assistant.service';
import { TranslatorService } from 'src/translator/translator.service';
import { conduct } from 'src/wallet/utils';
import { randomUUID } from 'crypto';
import { formatFileName } from 'src/shared';

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
    const generatedFileName = formatFileName(randomUUID(), fileName);
    const storageFile = await this.storage.upload(generatedFileName, file);

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
          file_name: generatedFileName,
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

  async like(likeFlashcardDto: LikeFlashcardDto) {
    const { cardId } = likeFlashcardDto;

    await this.prisma.feedback.create({
      data: { cardId, isAppropriate: true },
    });

    return true;
  }

  async dislike(dislikeFlashcardDto: DislikeFlashcardDto, userId: string) {
    const { cardId, textFeedback } = dislikeFlashcardDto;

    try {
      await this.prisma.$transaction(async (prisma) => {
        const feedback = await prisma.feedback.create({
          data: { cardId, isAppropriate: false, textFeedback },
          include: {
            card: {
              include: {
                user: {
                  include: {
                    Wallet: true,
                  },
                },
              },
            },
          },
        });

        if (!feedback.card.user) {
          throw new BadRequestException('User not found for the given card');
        }

        await prisma.wallet.update({
          where: { userId },
          data: { balance: conduct(feedback.card.user.Wallet.balance, 1) },
        });

        await this.storage.delete(feedback.card.file_name);
      });

      return true;
    } catch (error) {
      throw new BadRequestException('Failed to dislike the flashcard');
    }
  }
}
