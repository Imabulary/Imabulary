import { v3 } from '@google-cloud/translate';
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import * as adminAccount from '../../admin-account.json';
import { TRANSLATOR_GENERIC_ERROR } from './utils';
import { upperFirst } from 'lodash';

const { TranslationServiceClient } = v3;

@Injectable()
export class TranslatorService {
  private readonly translator = new TranslationServiceClient({
    credentials: adminAccount,
  });

  async translate(
    text: string[],
    options: { sourceLanguageCode: string; targetLanguageCode: string },
  ) {
    const [response] = await this.translator.translateText({
      contents: text,
      mimeType: 'text/plain',
      parent: `projects/${process.env.PROJECT_ID}/locations/us-central1`,
      ...options,
    });

    const translations = response.translations;

    if (!translations?.length) {
      throw new InternalServerErrorException(TRANSLATOR_GENERIC_ERROR);
    }

    return translations.map(
      (translation) => upperFirst(translation.translatedText.trim()) || '',
    );
  }
}
