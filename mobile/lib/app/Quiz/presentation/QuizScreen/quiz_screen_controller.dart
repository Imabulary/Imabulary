import 'dart:math';

import 'package:mobile/app/Flashcard/domain/card.dart';

class QuizScreenController {
  static List<FlashCard> generateOptions(
    List<FlashCard> flashcards,
    FlashCard correctFlashcard,
  ) {
    final random = Random();

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

    return options;
  }
}
