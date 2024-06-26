import { VertexAI } from '@google-cloud/vertexai';
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import * as adminAccount from '../../admin-account.json';
import { get, upperFirst } from 'lodash';
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
    model: 'gemini-1.5-pro',
    generation_config: { max_output_tokens: 20, temperature: 1 },
  });

  async generatePhrase(word: string) {
    const prompt = `Create a simple phrase with the word ${word.toLowerCase()}.`;

    const rules = [
      'The length of the phrase must be maximum of 20 words',
      'The length of the phrase must be minimum of 7 words',
      'Do not cover a string in quotes',
      'Asnwer only with the phrase, no additional text is needed',
      'Keep the phrase simple, do not need to make it too creative',
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

    return upperFirst(text.trim());
  }
}
