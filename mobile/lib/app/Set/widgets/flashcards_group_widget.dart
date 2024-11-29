import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Home/widgets/FlashcardListItem/flashcard_list_item_controller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/widgets/list_item.dart';

class FlashcardsGroupWidget extends ConsumerWidget {
  const FlashcardsGroupWidget({
    super.key,
    required this.title,
    required this.flashCards,
  });

  final String title;
  final List<FlashCard> flashCards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypeSetting(
          title,
          variant: TextVariants.headlineMedium,
          style: const TextStyle(color: AppColors.white),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (BuildContext context, int index) => ListItem(
            image: flashCards[index].image_url,
            label: flashCards[index].word,
            sublabel: flashCards[index].translated_word,
            onTap: () {
              ref
                  .read(flashcardServiceProvider.notifier)
                  .openFlashcard(flashCards[index]);
              FlashCardItemController.redirectToFlashCardScreen(context);
            },
          ),
          itemCount: flashCards.length,
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
