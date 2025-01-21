import { GeneratePhraseTemplate } from './generate-phrase.template';

export class ExplainTemplate extends GeneratePhraseTemplate {
  protected getRules() {
    return [
      'Act as a language expert providing clear and concise explanations',
      'The explanation must be between 7 and 20 words long, ensuring it is fully formed and not cut off',
      'Do not include punctuation marks at the end of the phrase',
      'Keep the description broad, simple, and avoid unnecessary creative elaboration',
      'Do not use quotes around any strings',
      'Provide only the explanation without additional text',
    ].join('. ');
  }

  protected getPrompt(word: string) {
    return `Explain the given input: "${word.toLowerCase()}", with a complete, general description focused on usage, aimed at a general audience.`;
  }
}
