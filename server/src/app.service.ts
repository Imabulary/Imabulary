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

@Injectable()
export class AppService {
  private visionClient = new vision.ImageAnnotatorClient({
    credentials: adminAccount,
  });

  private vertexAI = new VertexAI({
    googleAuthOptions: {
      credentials: adminAccount,
    },
    project: process.env.GCP_PROJECT_ID,
    location: 'us-central1',
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

  async handleImage(fileName: string, file: Buffer) {
    const imageUrl = await this.uploadToExternalStorage(fileName, file);

    const objectOnImage = await this.analyze(imageUrl);

    const relatedPhrase = await this.generateWordRelatedPhrase(objectOnImage);

    return {
      result: relatedPhrase,
    };
  }

  private async generateWordRelatedPhrase(word: string) {
    const responseStream = await this.generativeModel.generateContentStream({
      contents: [
        {
          role: 'user',
          parts: [
            {
              text: `Generate a creative and coherent phrase using the word ${word.toLowerCase()}. The length of the phrase must be maximum of 10 words. Do not cover a string in quotes`,
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

    return result.localizedObjectAnnotations[0].name;
  }
}
