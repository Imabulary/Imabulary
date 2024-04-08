import 'package:flutter/material.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/app/FlashCard/presentation/flash_card.dart';

class FlashCardItemController {
  const FlashCardItemController(this.flashCard);

  final FlashCard flashCard;

  void Function() redirectToFlashCardScreen(BuildContext context) => () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FlashCardScreen(flashCard: flashCard),
          ),
        );
      };
}
