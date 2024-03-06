import 'package:flutter/material.dart';
import 'package:mobile/app/layout.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/Card/card.dart';

class FlashCardScreen extends StatelessWidget {
  const FlashCardScreen({super.key, required this.flashCard});

  final FlashCard flashCard;

  @override
  Widget build(BuildContext context) {
    return Layout(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            flashCard.image_url,
            width: double.infinity,
            height: 256,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        TypeSetting(flashCard.word, variant: TextVariants.titleLarge),
        const SizedBox(
          height: 16,
        ),
        TypeSetting(
          'Relate phrases',
          style: TextStyle(
            color: colors['primary'],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        TypeSetting(flashCard.phrase),
        const TypeSetting(
          'English',
          variant: TextVariants.bodySmall,
        ),
        const SizedBox(
          height: 12,
        ),
        TypeSetting(flashCard.translated_phrase),
        const TypeSetting(
          'Ukrainian',
          variant: TextVariants.bodySmall,
        ),
      ],
    ));
  }
}
