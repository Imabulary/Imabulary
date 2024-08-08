import { VertexAI } from '@google-cloud/vertexai';
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { get, upperFirst } from 'lodash';
import * as adminAccount from '../../admin-account.json';
import { ASSISTANT_EXPLANATION_ERROR, ASSISTANT_PHRASE_ERROR } from './utils';

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
    model: 'gemini-1.0-pro',
    generation_config: { max_output_tokens: 20, temperature: 1 },
  });

  async generatePhrase(word: string) {
    const prompt = `Create a phrase with the word ${word.toLowerCase()}.`;

    const rules = [
      'The length of the phrase must be maximum of 20 words',
      'The length of the phrase must be minimum of 7 words',
      'Do not cover a string in quotes',
      'Asnwer only with the phrase, no additional text is needed',
      'Keep the phrase simple, do not need to make it creative',
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
        ASSISTANT_PHRASE_ERROR.replace(':word', word),
      );
    }

    return upperFirst(text.trim());
  }

  async explain(word: string) {
    const prompt = `Explain the word "${word.toLowerCase()}".`;

    const rules = [
      'The length of the explanation must be maximum of 20 words',
      'The length of the explanation must be minimum of 7 words',
      'Do not cover a string in quotes',
      'Asnwer only with the explanation, no additional text is required',
      'Keep the explanation simple, do not make it too creative',
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
        ASSISTANT_EXPLANATION_ERROR.replace(':word', word),
      );
    }

    return upperFirst(text.trim());
  }

  async speechPart(word: string) {
    const prompt = `To what part of the speech word "${word.toLowerCase()}" belongs to?.`;

    const rules = [
      'Do not cover a string in quotes',
      'Asnwer only with the part of the speech, no additional text is required',
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
        ASSISTANT_EXPLANATION_ERROR.replace(':word', word),
      );
    }

    return upperFirst(text.trim());
  }
}
