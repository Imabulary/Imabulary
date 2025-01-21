import { File } from '@google-cloud/storage';
import { BadRequestException, Injectable } from '@nestjs/common';
import { AssistantService } from 'src/assistant/assistant.service';
import { FeedbackService } from 'src/feedback/feedback.service';
import { PrismaService } from 'src/prisma';
import { QuizService } from 'src/quiz/quiz.service';
import { Filters, ServerPagination } from 'src/shared';
import { FLASHCARD_DEFAULT_COST } from 'src/shared/constants';
import { SoundService } from 'src/sound/sound.service';
import { StorageService } from 'src/storage/storage.service';
import { IBucketFolders } from 'src/storage/utils';
import { TranslatorService } from 'src/translator/translator.service';
import { VisionService } from 'src/vision/vision.service';
import { WalletService } from 'src/wallet/wallet.service';
import {
  CreateFlashcardDTO,
  DisorganizeFlashcardsDTO,
  OrganizeFlashcardsDTO,
  ProcessImageDTO,
} from './dto';
import { Prisma } from '@prisma/client';
import {
  FlashcardNotFoundException,
  FlashcardRegeneratedException,
  FlashcardWithFeedbackException,
} from './utils';
import { isEmpty } from 'lodash';
import { DislikeFlashcardDTO } from 'src/feedback/dto/feedback.dto';
import { NlpService } from 'src/nlp';
import { isSingle } from 'src/utils';

@Injectable()
export class FlashCardsService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly storage: StorageService,
    private readonly vision: VisionService,
    private readonly assistant: AssistantService,
    private readonly nlp: NlpService,
    private readonly translator: TranslatorService,
    private readonly sound: SoundService,
    private readonly feedbackService: FeedbackService,
    private readonly wallet: WalletService,
    private readonly quizService: QuizService,
  ) {}

  async scan(userId: string, fileName: string, file: Buffer) {
    const { storageFile: imageFile, generatedFileName: imageName } =
      await this.storage.upload(IBucketFolders.IMAGE, fileName, file);

    try {
      const imageUrl = await this.storage.getFileURL(imageFile);

      return this.processImage({ imageUrl, imageName }, userId);
    } catch (error) {
      await imageFile.delete();

      throw error;
    }
  }

  async create(
    { objectOnImage, imageUrl, imageName, isRegeneration }: CreateFlashcardDTO,
    userId: string,
  ) {
    let audioFile: File;

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

      const [audioUrl, relatedPhrase, explanation, speechPart, status] =
        await Promise.all([
          this.storage.getFileURL(audioFile),
          this.assistant.generatePhrase(objectOnImage),
          this.assistant.explain(objectOnImage),
          this.nlp.speechPart(objectOnImage),
          this.quizService.findNotStudiedQuizStatus(),
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

      await this.wallet.manage(userId, FLASHCARD_DEFAULT_COST, 'subtract');

      return card;
    } catch (error) {
      await this.storage.delete(imageName);
      await audioFile.delete();

      throw error;
    }
  }

  async processImage(
    { imageName, imageUrl, isRegeneration }: ProcessImageDTO,
    userId: string,
  ) {
    // TODO: Take these variables from settings of user profile, once it's done
    const sourceLanguageCode = 'en-US';
    const targetLanguageCode = 'uk-UA';

    const objectsOnImage = await this.vision.analyze(imageUrl);

    if (isSingle(objectsOnImage)) {
      const objectOnImage = objectsOnImage[0].name;

      return this.create(
        {
          imageName,
          imageUrl,
          objectOnImage,
          isRegeneration: true,
        },
        userId,
      );
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

    return {
      objectsOnImage: translatedObjectsOnImage,
      imageName,
      imageUrl,
      isRegeneration,
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
        include: {
          QuizStatus: true,
        },
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

  // TODO: add tests
  async delete(id: string, userId: string) {
    const flashcard = await this.findOne({ id, userId });

    if (!flashcard) {
      throw new FlashcardNotFoundException(id, 'FlashCardsService.delete');
    }

    await Promise.all([
      this.prisma.cards.update({
        where: { id },
        data: {
          userId: null,
          deletedAt: new Date(),
        },
      }),
      this.prisma.cardsOnSets.deleteMany({
        where: { flashcardId: id },
      }),
    ]);

    return true;
  }

  // TODO: add tests
  async regenerate(flashcardId: string, userId: string) {
    const currentFlashcard = await this.prisma.cards.update({
      data: {
        userId: null,
        deletedAt: new Date(),
      },
      where: {
        id: flashcardId,
      },
    });

    await this.prisma.cardsOnSets.deleteMany({
      where: { flashcardId },
    });

    if (currentFlashcard.is_regenerated) {
      throw new FlashcardRegeneratedException(flashcardId);
    }

    const { image_name: imageName, image_url: imageUrl } = currentFlashcard;

    return this.processImage(
      { imageUrl, imageName, isRegeneration: true },
      userId,
    );
  }

  // TODO: add tests
  async dislike(
    cardId: string,
    dislikeFlashcardDto: DislikeFlashcardDTO,
    userId: string,
  ) {
    const { text, categories } = dislikeFlashcardDto;

    const flashcard = await this.findOne({ id: cardId });

    if (!flashcard) {
      throw new FlashcardNotFoundException(cardId, 'FlashCardsService.dislike');
    }

    const existingFeedback = await this.feedbackService.findOne({
      cardId: flashcard.id,
    });

    if (existingFeedback) {
      throw new FlashcardWithFeedbackException(
        flashcard.id,
        existingFeedback.id,
      );
    }

    if (isEmpty(categories) && isEmpty(text)) {
      throw new BadRequestException(
        'Provide at least one category or text to your feedback',
      );
    }

    await Promise.all([
      this.wallet.manage(userId, FLASHCARD_DEFAULT_COST, 'add'),
      this.feedbackService.create(
        {
          cardId,
          text,
          categories,
        },
        userId,
      ),
      this.delete(cardId, userId),
    ]);

    return true;
  }

  findOne(where: Prisma.CardsWhereUniqueInput) {
    return this.prisma.cards.findFirst({ where });
  }
}
