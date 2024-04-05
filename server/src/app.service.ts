import { Injectable } from '@nestjs/common';
import { AssistantService } from './assistant/assistant.service';
import { PrismaService } from './prisma';
import { StorageService } from './storage/storage.service';
import { TranslatorService } from './translator/translator.service';
import { VisionService } from './vision/vision.service';

@Injectable()
export class AppService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly storage: StorageService,
    private readonly vision: VisionService,
    private readonly assistant: AssistantService,
    private readonly translator: TranslatorService,
  ) {}

  async handleImage(userId: string, fileName: string, file: Buffer) {
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
}
