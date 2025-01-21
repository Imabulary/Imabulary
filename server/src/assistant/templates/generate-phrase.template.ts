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
    return `Generate a down-to-earth phrase using the provided input: "${word.toLowerCase()}".`;
  }

  protected getRules() {
    return [
      'Act as a language learning assistant specializing in creating simple and relatable phrases for learners at A1 to B2 proficiency levels',
      'The phrase should help users understand and remember the input by reflecting everyday situations',
      'Ensure the phrase is between 7 and 20 words long, fully formed, and not cut off',
      'Do not include punctuation marks at the end of the phrase',
      'Keep the tone neutral, avoiding unnecessary complexity or creativity',
      'Do not use quotes around the phrase',
      'Provide only the phrase as the output, with no additional text',
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
    console.log(get(content, 'response.candidates[0].content.parts'));

    const text = get(content, 'response.candidates[0].content.parts[0].text');

    if (isEmpty(text)) {
      throw new InternalServerErrorException();
    }

    return text.trim();
  }
}
