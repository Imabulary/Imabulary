export const NOUN = 'NOUN';

export const partOfSpeechTags = {
  ADJ: 'adjective',
  ADP: 'adposition',
  ADV: 'adverb',
  CONJ: 'conjunction',
  DET: 'determiner',
  [NOUN]: 'noun',
  NUM: 'cardinal number',
  PRON: 'pronoun',
  PRT: 'particle or other function word',
  PUNCT: 'punctuation',
  VERB: 'verb',
  AFFIX: 'Affix',
  NP: 'noun phrase',
  PHRS: 'phrase',
  X: '',
  UNKNOWN: '',
};

export type PartOfSpeechTag = keyof typeof partOfSpeechTags;
