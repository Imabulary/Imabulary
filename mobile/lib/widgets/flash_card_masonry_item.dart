import 'package:flutter/material.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/widgets/flash_card_item_controller.dart';

class FlashCardMasonryItem extends StatelessWidget {
  const FlashCardMasonryItem(this.flashCard, {super.key});

  final FlashCard flashCard;

  @override
  Widget build(BuildContext context) {
    final flashCardScreenController = FlashCardItemController(flashCard);

    return GestureDetector(
      onTap: flashCardScreenController.redirectToFlashCardScreen(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(flashCard.image_url),
          ),
          const SizedBox(
            height: 4,
          ),
          TypeSetting(
            flashCard.word,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TypeSetting(
            flashCard.translated_word,
            variant: TextVariants.bodySmall,
          )
        ],
      ),
    );
  }
}
