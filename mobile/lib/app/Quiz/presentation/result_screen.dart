import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Quiz/domain/result.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/widgets/list_item.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.results});

  final List<Result> results;

  @override
  Widget build(BuildContext context) {
    return Layout(SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TypeSetting(
            "Great job!",
            variant: TextVariants.titleLarge,
          ),
          const TypeSetting(
            "You've completed the quiz.",
            variant: TextVariants.headlineLarge,
          ),
          const SizedBox(
            height: 36,
          ),
          const TypeSetting(
            'Results:',
            variant: TextVariants.headlineMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
            itemBuilder: (BuildContext context, int index) => ListItem(
              label: results[index].question,
              sublabel:
                  "Your answer: ${results[index].answer}\nCorrect answer: ${results[index].correctAnswer}",
              image: results[index].imageUrl,
              tileColor: results[index].answer == results[index].correctAnswer
                  ? AppColors.success
                  : AppColors.error,
            ),
            itemCount: results.length,
          ),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => AutoRouter.of(context).popUntilRoot(),
              child: const TypeSetting(
                'Go to the Home',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
