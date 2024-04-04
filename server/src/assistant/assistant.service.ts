import { VertexAI } from '@google-cloud/vertexai';
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import * as adminAccount from '../../admin-account.json';
import { get } from 'lodash';
import { ASSISTANT_GENERIC_ERROR } from './utils';

@Injectable()
export class AssistantService {
  private vertexAI = new VertexAI({
    googleAuthOptions: {
      credentials: adminAccount,
    },
    project: process.env.PROJECT_ID,
    location: 'us-central1',
  });

  private generativeModel = this.vertexAI.getGenerativeModel({
    model: 'gemini-pro',
    generation_config: { max_output_tokens: 20, temperature: 1 },
  });

  async generatePhrase(word: string) {
    const prompt = `Generate a simple phrase using the word ${word.toLowerCase()}.`;

    const rules = [
      'The length of the phrase must be maximum of 20 words',
      'Do not cover a string in quotes',
      'Phrase must contain the word itself',
    ].join('. ');

    const result = await this.generativeModel.generateContent({
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

    const text = get(result, 'response.candidates[0].content.parts[0].text');

    if (!text) {
      throw new InternalServerErrorException(
        ASSISTANT_GENERIC_ERROR.replace(':word', word),
      );
    }

    return text;
  }
}
