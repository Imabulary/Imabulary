import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/FlashCard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/domain/card.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/app/Home/widgets/FlashcardListItem/flashcard_list_item_controller.dart';

class FlashCardMasonryItem extends ConsumerWidget {
  const FlashCardMasonryItem(this.flashCard, {super.key});

  final FlashCard flashCard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(flashcardServiceProvider.notifier).openFlashcard(flashCard);
        FlashCardItemController.redirectToFlashCardScreen(context);
      },
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
