import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
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
import { SoundService } from 'src/sound/sound.service';
import { IBucketFolders } from 'src/storage/utils';
import { FeedbackService } from 'src/feedback/feedback.service';
import { isEmpty } from 'lodash';
import { ProcessImageProps } from './interface';
import { File } from '@google-cloud/storage';

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
  ) {}

  async scan(userId: string, fileName: string, file: Buffer) {
    const { storageFile: imageFile, generatedFileName: generatedImageName } =
      await this.storage.upload(IBucketFolders.IMAGE, fileName, file);

    try {
      const imageUrl = await this.storage.getFileURL(imageFile);

      const card = await this.processImage({
        imageUrl,
        userId,
        generatedImageName,
      });

      return card;
    } catch (error) {
      await imageFile.delete();

      throw error;
    }
  }

  async processImage({
    imageUrl,
    userId,
    generatedImageName,
    isRegeneration = false,
  }: ProcessImageProps) {
    let audioFile: File;

    try {
      const objectOnImage = await this.vision.analyze(imageUrl);

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

      const [relatedPhrase, explanation, speechPart] = await Promise.all([
        this.assistant.generatePhrase(objectOnImage),
        this.assistant.explain(objectOnImage),
        this.assistant.speechPart(objectOnImage),
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
          audio_url: audioUrl,
          is_regenerated: isRegeneration,
          audio_name: generatedAudioName,
          userId,
          image_name: generatedImageName,
          explanation,
        },
      });

      return card;
    } catch (error) {
      audioFile?.delete();

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

  async regenerate(cardId: string, userId: string) {
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
      throw new BadRequestException('This card has already been regenerated');
    }

    const card = await this.processImage({
      imageUrl: currentCard.image_name,
      userId: userId,
      generatedImageName: currentCard.image_name,
      isRegeneration: true,
    });

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
      throw new NotFoundException('This card has a feedback already');
    }

    if ((isEmpty(categories) && !text) || (!isEmpty(categories) && text)) {
      throw new BadRequestException(
        'Either feedback category(-ies) or text must be provided, but not both',
      );
    }

    await this.feedback.leaveFeedback({
      cardId,
      text,
      categories,
    });

    return {
      message: 'Thank you for your feedback!',
    };
  }
}
