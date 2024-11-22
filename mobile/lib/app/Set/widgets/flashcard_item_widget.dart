import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class FlashcardItemWidget extends StatelessWidget {
  const FlashcardItemWidget({
    super.key,
    required this.flashCard,
  });

  final FlashCard flashCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey,
        border: Border.all(color: AppColors.lightGrey, width: 0.2),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              flashCard.image_url,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TypeSetting(
                flashCard.word,
                variant: TextVariants.bodyLarge,
                style: const TextStyle(color: AppColors.white),
              ),
              TypeSetting(
                flashCard.translated_word,
                variant: TextVariants.bodySmall,
                style: const TextStyle(color: AppColors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}