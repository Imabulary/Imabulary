import 'package:flutter/material.dart';
import 'package:mobile/app/FlashCard/presentation/flashcard_screen.dart';

class FlashCardItemController {
  static void redirectToFlashCardScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FlashcardScreen(),
      ),
    );
  }
}
