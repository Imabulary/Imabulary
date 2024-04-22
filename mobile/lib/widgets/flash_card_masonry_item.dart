import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/FlashCard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/domain/card.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/app/Home/widgets/FlashcardListItem/flashcard_list_item_controller.dart';

class FlashCardMasonryItem extends ConsumerWidget {
  const FlashCardMasonryItem(this.flashcard, {super.key, this.onLongPress});

  final FlashCard flashcard;
  final void Function(String flashcardId)? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onLongPress: onLongPress != null
          ? () {
              onLongPress!(flashcard.id);
            }
          : null,
      onTap: () {
        ref.read(flashcardServiceProvider.notifier).openFlashcard(flashcard);
        FlashCardItemController.redirectToFlashCardScreen(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(flashcard.image_url),
          ),
          const SizedBox(
            height: 4,
          ),
          TypeSetting(
            flashcard.word,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TypeSetting(
            flashcard.translated_word,
            variant: TextVariants.bodySmall,
          )
        ],
      ),
    );
  }
}
