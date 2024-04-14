String pluralize(String word, int? count) {
  count = count ?? 0;
  final isSingular = count == 1;

  if (isSingular) {
    return word;
  }

  // If the word ends with 'y' preceded by a consonant, change 'y' to 'ies'
  if (word.endsWith('y') && _isConsonant(word[word.length - 2])) {
    return '$count ${word.substring(0, word.length - 1)}ies';
  }

  return '$count ${word}s';
}

bool _isConsonant(String character) {
  return !('aeiou'.contains(character));
}
