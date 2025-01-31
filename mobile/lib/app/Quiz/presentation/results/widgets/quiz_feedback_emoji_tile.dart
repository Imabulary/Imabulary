import 'package:flutter/material.dart';
import 'package:mobile/app/Quiz/presentation/results/domain/quiz_feedback_level.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class QuizFeedbackEmojiTile extends StatelessWidget {
  const QuizFeedbackEmojiTile({
    super.key,
    required this.level,
    this.onTap,
  });

  final QuizFeedbackLevel level;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Image.asset(
                level.imagePath,
                width: 40,
                height: 40,
              ),
              const SizedBox(height: 4),
              TypeSetting(
                level.name,
                style: const TextStyle(color: AppColors.lightGrey),
                variant: TextVariants.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
