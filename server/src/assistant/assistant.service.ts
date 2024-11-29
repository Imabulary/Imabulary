import { VertexAI } from '@google-cloud/vertexai';
import { Injectable } from '@nestjs/common';
import * as adminAccount from '../../admin-account.json';
import { ExplainTemplate } from './templates/explain.template';
import { GeneratePhraseTemplate } from './templates/generate-phrase.template';

@Injectable()
export class AssistantService {
  private readonly vertexAI = new VertexAI({
    googleAuthOptions: {
      credentials: adminAccount,
    },
    project: process.env.PROJECT_ID,
    location: 'us-central1',
  });

  private readonly generativeModel = this.vertexAI.getGenerativeModel({
    model: 'gemini-1.0-pro',
    generation_config: { max_output_tokens: 20, temperature: 1 },
  });

  generatePhrase(word: string) {
    const generatePhraseTemplate = new GeneratePhraseTemplate(
      this.generativeModel,
    );

    return generatePhraseTemplate.run(word);
  }

  async explain(word: string) {
    const explainTemplate = new ExplainTemplate(this.generativeModel);

    return explainTemplate.run(word);
  }
}
