import 'package:flutter/material.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/app/FlashCard/presentation/flash_card.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class FlashCardListItem extends StatelessWidget {
  const FlashCardListItem(this.flashCard, {super.key});

  final FlashCard flashCard;

  void redirectToFlashCardScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlashCardScreen(flashCard: flashCard),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        redirectToFlashCardScreen(context);
      },
      contentPadding: const EdgeInsets.only(left: 10, right: 10),
      tileColor: colors['muted'],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          flashCard.image_url,
          width: 55,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: TypeSetting(flashCard.word),
      subtitle: TypeSetting(
        flashCard.translated_word,
        variant: TextVariants.bodySmall,
      ),
    );
  }
}
