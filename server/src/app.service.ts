import { Injectable } from '@nestjs/common';
import admin from 'firebase-admin';
import { getDownloadURL } from 'firebase-admin/storage';
import vision from '@google-cloud/vision';
import {
  VertexAI,
  HarmCategory,
  HarmBlockThreshold,
} from '@google-cloud/vertexai';
import * as adminAccount from '../admin-account.json';
import { v3 } from '@google-cloud/translate';
import { PrismaService } from './prisma';
import { Prisma } from '@prisma/client';

const { TranslationServiceClient } = v3;

@Injectable()
export class AppService {
  constructor(private prisma: PrismaService) {}

  private location = 'us-central1';

  private visionClient = new vision.ImageAnnotatorClient({
    credentials: adminAccount,
  });

  private vertexAI = new VertexAI({
    googleAuthOptions: {
      credentials: adminAccount,
    },
    project: process.env.PROJECT_ID,
    location: this.location,
  });

  private generativeModel = this.vertexAI.preview.getGenerativeModel({
    model: 'gemini-pro',
    generation_config: { max_output_tokens: 20, temperature: 1 },
    safety_settings: [
      {
        category: HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
        threshold: HarmBlockThreshold.BLOCK_NONE,
      },
    ],
  });

  private translator = new TranslationServiceClient({
    credentials: adminAccount,
  });

  async handleImage(fileName: string, file: Buffer) {
    const imageUrl = await this.uploadToExternalStorage(fileName, file);

    const objectOnImage = await this.analyze(imageUrl);

    const relatedPhrase = await this.generateWordRelatedPhrase(objectOnImage);

    const sourceLanguageCode = 'en-US';
    const targetLanguageCode = 'uk-UA';

    const [translatedWord, translatedPhrase] = await this.translate(
      [objectOnImage, relatedPhrase],
      { sourceLanguageCode, targetLanguageCode },
    );

    const card = await this.saveToDB({
      word: objectOnImage,
      phrase: relatedPhrase,
      translated_phrase: translatedPhrase,
      translated_word: translatedWord,
      target_language: targetLanguageCode,
      source_language: sourceLanguageCode,
      image_url: imageUrl,
    });

    return {
      result: card,
    };
  }

  private async saveToDB(data: Prisma.CardsCreateInput) {
    return this.prisma.cards.create({ data });
  }

  private async translate(
    text: string[],
    options: { sourceLanguageCode: string; targetLanguageCode: string },
  ) {
    const [response] = await this.translator.translateText({
      contents: text,
      mimeType: 'text/plain',
      sourceLanguageCode: options.sourceLanguageCode,
      targetLanguageCode: options.targetLanguageCode,
      parent: `projects/${process.env.PROJECT_ID}/locations/${this.location}`,
    });

    return response.translations.map(
      (translation) => translation.translatedText,
    );
  }

  private async generateWordRelatedPhrase(word: string) {
    const prompt = `Generate a creative and coherent phrase using the word ${word.toLowerCase()}.`;

    const rules = [
      'The length of the phrase must be maximum of 10 words',
      'Do not cover a string in quotes',
      'Phrase must contain the word itself',
    ].join('. ');

    const responseStream = await this.generativeModel.generateContentStream({
      contents: [
        {
          role: 'user',
          parts: [
            {
              text: `${prompt} ${rules}`,
            },
          ],
        },
      ],
    });

    const response = await responseStream.response;

    return response.candidates[0].content.parts[0].text;
  }

  private async uploadToExternalStorage(fileName: string, file: Buffer) {
    const bucket = admin.storage().bucket();
    const storageFile = bucket.file(fileName);

    await storageFile.save(file);

    const imageUrl = await getDownloadURL(storageFile);

    return imageUrl;
  }

  private async analyze(imageUrl: string) {
    const [result] = await this.visionClient.objectLocalization(imageUrl);

    return result.localizedObjectAnnotations[0]?.name;
  }
}
