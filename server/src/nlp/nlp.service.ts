import { Injectable } from '@nestjs/common';
import { get, isEmpty } from 'lodash';
import { LanguageServiceClient } from '@google-cloud/language';
import * as adminAccount from '../../admin-account.json';
import { NOUN, partOfSpeechTags } from './utils';
import { isSingle } from 'src/utils';

/**
 * Service for Natural Language Processing (NLP) tasks.
 */
@Injectable()
export class NlpService {
  private readonly client = new LanguageServiceClient({
    credentials: adminAccount,
  });

  /**
   * Analyzes the part of speech for a given text content.
   *
   * @param content - The text to be analyzed.
   *
   * @returns
   * - If the content is empty, returns an empty string.
   * - If a single word is provided, it returns the part of speech as defined in `partOfSpeechTags`.
   * - If multiple words are provided:
   *   - Returns "NP" (noun phrase) if all words are tagged as nouns.
   *   - Returns "PHRS" (phrase) if the words do not conform to a single noun phrase.
   */
  async speechPart(content: string): Promise<string> {
    if (isEmpty(content)) {
      return '';
    }

    const [result] = await this.client.analyzeSyntax({
      document: { content, type: 'PLAIN_TEXT' },
    });

    const tokens = result.tokens;

    if (isSingle(tokens)) {
      const partOfSpeechTag: string = get(tokens, '[0].partOfSpeech.tag');

      if (isEmpty(partOfSpeechTag)) {
        return '';
      }

      return partOfSpeechTags[partOfSpeechTag] ?? '';
    }

    const isEveryWordNoun = tokens.every(
      (token) => token.partOfSpeech.tag === NOUN,
    );

    return isEveryWordNoun ? partOfSpeechTags.NP : partOfSpeechTags.PHRS;
  }
}
