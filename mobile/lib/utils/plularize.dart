// TODO: add tests
String pluralize(String word, num? count) {
  final amount = (count ?? 0).toStringAsFixed(2);
  final formattedAmount =
      amount.endsWith('.00') ? amount.split('.')[0] : amount;
  final isSingular = count == 1;

  if (isSingular) {
    return '1 $word';
  }

  // If the word ends with 'y' preceded by a consonant, change 'y' to 'ies'
  if (word.endsWith('y') && _isConsonant(word[word.length - 2])) {
    return '$formattedAmount ${word.substring(0, word.length - 1)}ies';
  }

  return '$formattedAmount ${word}s';
}

bool _isConsonant(String character) {
  return !('aeiou'.contains(character));
}
