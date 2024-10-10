import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { File } from '@google-cloud/storage';
import { PrismaService } from 'src/prisma';
import { Filters, ServerPagination } from 'src/shared';
import {
  DisorganizeFlashcardsDTO,
  OrganizeFlashcardsDTO,
  DislikeFlashcardDto,
  LikeFlashcardDto,
  CreateFlashcardDTO,
} from './dto';
import { StorageService } from 'src/storage/storage.service';
import { VisionService } from 'src/vision/vision.service';
import { AssistantService } from 'src/assistant/assistant.service';
import { TranslatorService } from 'src/translator/translator.service';
import { SoundService } from 'src/sound/sound.service';
import { IBucketFolders } from 'src/storage/utils';
import { FeedbackService } from 'src/feedback/feedback.service';
import { QUIZ_STATUS } from 'src/quiz/utils/quiz-status';
import { WalletService } from 'src/wallet/wallet.service';
import { DEFAULT_COST } from 'src/shared/constants';

@Injectable()
export class FlashCardsService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly storage: StorageService,
    private readonly vision: VisionService,
    private readonly assistant: AssistantService,
    private readonly translator: TranslatorService,
    private readonly sound: SoundService,
    private readonly feedback: FeedbackService,
    private readonly wallet: WalletService,
  ) {}

  async scan(userId: string, fileName: string, file: Buffer) {
    const { storageFile: imageFile, generatedFileName: imageName } =
      await this.storage.upload(IBucketFolders.IMAGE, fileName, file);

    try {
      const imageUrl = await this.storage.getFileURL(imageFile);

      const objectsOnImage = await this.processImage(imageUrl);

      if (objectsOnImage.length === 1) {
        const objectOnImage = objectsOnImage[0].name;

        return this.create({ imageName, imageUrl, objectOnImage }, userId);
      }

      return { objectsOnImage, imageName, imageUrl };
    } catch (error) {
      await imageFile.delete();

      throw error;
    }
  }

  async create(
    { objectOnImage, imageUrl, isRegeneration, imageName }: CreateFlashcardDTO,
    userId: string,
  ) {
    let audioFile: File;

    const imageFileName = imageUrl.split('/').pop();

    try {
      const audioSpeechStream = await this.sound.synthesizeSpeech(
        objectOnImage,
      );

      const {
        storageFile: uploadedAudioFile,
        generatedFileName: generatedAudioName,
      } = await this.storage.upload(
        IBucketFolders.AUDIO,
        `${objectOnImage}.mp3`,
        audioSpeechStream,
      );

      audioFile = uploadedAudioFile;

      const audioUrl = await this.storage.getFileURL(audioFile);

      const [relatedPhrase, explanation, speechPart, status] =
        await Promise.all([
          this.assistant.generatePhrase(objectOnImage),
          this.assistant.explain(objectOnImage),
          this.assistant.speechPart(objectOnImage),
          this.prisma.quizCardStatus.findFirst({
            where: { name: QUIZ_STATUS.NOT_STUDIED },
          }),
        ]);

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
          quizStatusId: status.id,
          audio_url: audioUrl,
          is_regenerated: isRegeneration,
          audio_name: generatedAudioName,
          userId,
          image_name: imageName,
          explanation,
        },
      });

      await this.wallet.deductBalance(userId, DEFAULT_COST);

      return card;
    } catch (error) {
      await this.storage.delete(imageFileName);
      await audioFile.delete();

      throw error;
    }
  }

  async processImage(imageUrl: string) {
    // TODO: Take these variables from settings of user profile, once it's done
    const sourceLanguageCode = 'en-US';
    const targetLanguageCode = 'uk-UA';

    const objectsOnImage = await this.vision.analyze(imageUrl);

    if (objectsOnImage.length === 1) {
      return objectsOnImage;
    }

    const namesToTranslate = objectsOnImage.map((item) => item.name);

    const translatedWords = await this.translator.translate(namesToTranslate, {
      sourceLanguageCode,
      targetLanguageCode,
    });

    const translatedObjectsOnImage = objectsOnImage.map((item, index) => ({
      ...item,
      translatedName: translatedWords[index],
    }));

    return translatedObjectsOnImage;
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
  }

  async delete(cardId: string) {
    await Promise.all([
      this.prisma.cards.update({
        where: { id: cardId },
        data: {
          userId: null,
          deletedAt: new Date(),
        },
      }),
      this.prisma.cardsOnSets.deleteMany({
        where: { flashcardId: cardId },
      }),
    ]);

    return {
      message: 'Card was successfuly deleted!',
    };
  }

  async regenerateCard(cardId: string) {
    const currentCard = await this.prisma.cards.update({
      data: {
        userId: null,
        deletedAt: new Date(),
      },
      where: {
        id: cardId,
      },
    });

    await this.prisma.cardsOnSets.deleteMany({
      where: { flashcardId: cardId },
    });

    if (currentCard.is_regenerated) {
      throw new BadRequestException('This card had already regenerated');
    }

    const card = await this.processImage(currentCard.image_url);

    return {
      result: card,
    };
  }

  async dislike(dislikeFlashcardDto: DislikeFlashcardDto) {
    const { cardId, text, categories } = dislikeFlashcardDto;

    const existingFeedback = await this.prisma.feedback.findFirst({
      where: { id: cardId },
    });

    if (existingFeedback) {
      throw new NotFoundException('This card has feedback already');
    }

    if ((!categories && !text) || (categories && text)) {
      throw new BadRequestException(
        'Either categoryId or text must be provided, but not both',
      );
    }

    const fetchedFeedback = await this.feedback.create({
      cardId,
      text,
      categories,
    });

    if (!fetchedFeedback.card.user) {
      throw new NotFoundException('User not found for the given card');
    }

    return {
      message: 'Thank you for your feedback!',
    };
  }
}
