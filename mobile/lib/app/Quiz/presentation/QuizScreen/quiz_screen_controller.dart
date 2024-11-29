import 'dart:math';

import 'package:mobile/app/Flashcard/domain/card/card.dart';

class QuizScreenController {
  static List<FlashCard> generateOptions(
    List<FlashCard> flashcards,
    FlashCard correctFlashcard,
  ) {
    final random = Random();

    // Create a set to keep track of selected incorrect flashcards
    final selectedIncorrectFlashcards = {correctFlashcard};

    // Determine the number of incorrect answers based on flashcards length
    final int incorrectAnswersCount = flashcards.length >= 4 ? 3 : 1;

    // Generate unique incorrect options
    final List<FlashCard> incorrectFlashcards = [];

    while (incorrectFlashcards.length < incorrectAnswersCount) {
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
