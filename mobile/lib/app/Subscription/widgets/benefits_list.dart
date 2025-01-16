import 'package:flutter/material.dart';
import 'package:mobile/app/Subscription/domain/product/product.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/widgets/list_item.dart';

class BenefitsList extends StatelessWidget {
  const BenefitsList({super.key, required this.benefits});

  final Benefits benefits;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListItem(
          leading: const Icon(
            Icons.photo_camera_outlined,
            size: 40,
            color: Colors.white,
          ),
          label: benefits.coins.toString(),
          sublabel: 'Flashcards ${benefits.coinsFrequency}',
          tileColor: AppColors.muted,
        ),
        const SizedBox(
          height: 8,
        ),
        ListItem(
          leading: const Icon(
            Icons.perm_media_outlined,
            size: 40,
            color: Colors.white,
          ),
          label: benefits.sets.toString(),
          sublabel: 'Sets lifetime',
          tileColor: AppColors.muted,
        ),
        const SizedBox(
          height: 8,
        ),
        ListItem(
          leading: const Icon(
            Icons.add_photo_alternate_outlined,
            size: 40,
            color: Colors.white,
          ),
          label: benefits.flashcardsInSet == null
              ? 'Unlimited'
              : benefits.flashcardsInSet.toString(),
          sublabel: 'Flashcards in each set',
          tileColor: AppColors.muted,
        ),
        const SizedBox(
          height: 8,
        ),
        ListItem(
          leading: const Icon(
            Icons.quiz_outlined,
            size: 40,
            color: Colors.white,
          ),
          label: 'Unlimited',
          sublabel: 'Quizzes',
          tileColor: AppColors.muted,
        ),
      ],
    );
  }
}
