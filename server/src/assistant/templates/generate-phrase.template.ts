import { GenerateContentResult, GenerativeModel } from '@google-cloud/vertexai';
import { InternalServerErrorException } from '@nestjs/common';
import { get, isEmpty } from 'lodash';

export class GeneratePhraseTemplate {
  private readonly generativeModel: GenerativeModel;

  constructor(generativeModel: GenerativeModel) {
    this.generativeModel = generativeModel;
  }

  async run(word: string) {
    const prompt = this.getPrompt(word);
    const rules = this.getRules();
    const content = await this.generateContent(prompt, rules);

    return this.getResult(content);
  }

  protected getPrompt(word: string) {
    return `Create a phrase with the word ${word.toLowerCase()}.`;
  }

  protected getRules() {
    return [
      'The length of the phrase must be maximum of 20 words',
      'The length of the phrase must be minimum of 7 words',
      'Do not cover a string in quotes',
      'Asnwer only with the phrase, no additional text is needed',
      'Keep the phrase simple, do not need to make it creative',
    ].join('. ');
  }

  protected generateContent(prompt: string, rules: string) {
    return this.generativeModel.generateContent({
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
  }

  protected getResult(content: GenerateContentResult) {
    const text = get(content, 'response.candidates[0].content.parts[0].text');

    if (isEmpty(text)) {
      throw new InternalServerErrorException();
    }

    return text.trim();
  }
}
