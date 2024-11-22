import 'package:flutter/material.dart';
import 'package:mobile/app/Quiz/domain/result.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';


class ResultItemWidget extends StatelessWidget {
  const ResultItemWidget({
    super.key,
    required this.result,
  });

  final Result result;

  @override
  Widget build(BuildContext context) {
    final isCorrect = result.correctAnswer == result.answer;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey,
        border: Border.all(color: isCorrect ? AppColors.green : AppColors.pink, width: 2),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              result.imageUrl,
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
                result.question,
                variant: TextVariants.bodyLarge,
                style: const TextStyle(color: AppColors.white),
              ),
              TypeSetting(
                'Your answer: ${result.answer}\nCorrect answer: ${result.correctAnswer}',
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