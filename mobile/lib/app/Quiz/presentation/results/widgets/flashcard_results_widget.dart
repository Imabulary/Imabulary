import 'package:flutter/material.dart';
import 'package:mobile/app/Quiz/domain/result.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/app/Quiz/presentation/results/widgets/result_item_widget.dart';

class FlashcardResultsWidget extends StatelessWidget {
  const FlashcardResultsWidget({
    super.key,
    required this.title,
    required this.results,
  });

  final String title;
  final List<Result> results;

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
            return ResultItemWidget(
              result: results[index],
            );
          },
          itemCount: results.length,
        ),
      ],
    );
  }
}