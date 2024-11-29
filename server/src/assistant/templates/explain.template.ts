import { GeneratePhraseTemplate } from './generate-phrase.template';

export class ExplainTemplate extends GeneratePhraseTemplate {
  protected getRules() {
    return [
      'The length of the explanation must be maximum of 20 words',
      'The length of the explanation must be minimum of 7 words',
      'Do not cover a string in quotes',
      'Asnwer only with the explanation, no additional text is required',
      'Keep the explanation simple, do not make it too creative',
    ].join('. ');
  }

  protected getPrompt(word: string) {
    return `Explain the word "${word.toLowerCase()}".`;
  }
}
