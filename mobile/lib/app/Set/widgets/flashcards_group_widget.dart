import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Set/widgets/flashcard_item_widget.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class FlashcardsGroupWidget extends StatelessWidget {
  const FlashcardsGroupWidget({
    super.key,
    required this.title,
    required this.flashCards,
  });

  final String title;
  final List<FlashCard> flashCards;

  @override
  Widget build(BuildContext context) {
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
          itemBuilder: (BuildContext context, int index) {
            return FlashcardItemWidget(
              flashCard: flashCards[index],
            );
          },
          itemCount: flashCards.length,
        ),
      ],
    );
  }

}