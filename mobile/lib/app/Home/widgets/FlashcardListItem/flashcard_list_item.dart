import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/FlashCard/application/flashcard_service.dart';
import 'package:mobile/app/FlashCard/domain/card/card.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/app/Home/widgets/FlashcardListItem/flashcard_list_item_controller.dart';
import 'package:mobile/widgets/list_item.dart';

class FlashCardListItem extends ConsumerWidget {
  const FlashCardListItem(this.flashCard, {super.key});

  final FlashCard flashCard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListItem(
      onTap: () {
        ref.read(flashcardServiceProvider.notifier).openFlashcard(flashCard);
        FlashCardItemController.redirectToFlashCardScreen(context);
      },
      tileColor: AppColors.muted,
      image: flashCard.image_url,
      label: flashCard.word,
      sublabel: flashCard.translated_word,
    );
  }
}
