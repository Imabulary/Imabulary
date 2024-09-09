import 'package:flutter/material.dart';
import 'package:Imabulary/app/Set/components/RemoveFlashcard/remove_flashcard.dart';

class FlashcardActions extends StatelessWidget {
  const FlashcardActions({super.key, required this.flashcardId});

  final String flashcardId;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        RemoveFlashcard(
          flashcardId: flashcardId,
        )
      ],
    );
  }
}
