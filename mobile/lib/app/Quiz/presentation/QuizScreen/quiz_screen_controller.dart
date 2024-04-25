import 'dart:math';

import 'package:mobile/app/Flashcard/domain/card.dart';

class QuizScreenController {
  static Map<String, dynamic> generateOptions(List<FlashCard> flashcards) {
    // Randomly pick a flashcard as the correct option
    final random = Random();
    final correctFlashcard = flashcards[random.nextInt(flashcards.length)];

    // Create a set to keep track of selected incorrect flashcards
    final selectedIncorrectFlashcards = {correctFlashcard};

    // Generate 3 unique incorrect options
    final List<FlashCard> incorrectFlashcards = [];

    while (incorrectFlashcards.length < 3) {
      final randomFlashcard = flashcards[random.nextInt(flashcards.length)];

      if (!selectedIncorrectFlashcards.contains(randomFlashcard)) {
        incorrectFlashcards.add(randomFlashcard);
        selectedIncorrectFlashcards.add(randomFlashcard);
      }
    }

    // Shuffle all options (correct and incorrect)
    final options = [correctFlashcard, ...incorrectFlashcards];
    options.shuffle();

    return {'list': options, 'correctFlashcard': correctFlashcard};
  }
}
