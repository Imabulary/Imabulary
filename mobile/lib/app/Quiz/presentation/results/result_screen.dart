import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Quiz/domain/result.dart';
import 'package:mobile/app/Quiz/presentation/results/widgets/flashcard_results_widget.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.results,
    required this.flashcards,
  });

  final List<Result> results;
  final List<SetFlashcard> flashcards;

  @override
  Widget build(BuildContext context) {
    final correctAnswers =
        results.where((result) => result.answer == result.correctAnswer);
    final wrongAnswers =
        results.where((result) => result.answer != result.correctAnswer);

    return Layout(
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TypeSetting(
              "Great work!",
              variant: TextVariants.headlineLarge,
            ),
            const SizedBox(height: 16),
            const TypeSetting(
              "You've completed the quiz.",
              variant: TextVariants.bodyLarge,
            ),
            const SizedBox(height: 16),
            const TypeSetting(
              'Results:',
              variant: TextVariants.headlineLarge,
            ),
            const SizedBox(height: 12),
            if (wrongAnswers.isNotEmpty)
              Column(
                children: [
                  FlashcardResultsWidget(
                    title: 'Wrong answers (${wrongAnswers.length})',
                    results: wrongAnswers.toList(),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    label: 'Fix my mistake',
                    onPressed: () {
                      AutoRouter.of(context).popUntilRoot();
                      SetAppBarController.startQuiz(context, flashcards)();
                    },
                    variat: ButtonVariant.elevatedExpanded,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            if (correctAnswers.isNotEmpty)
              Column(
                children: [
                  FlashcardResultsWidget(
                    title: 'Correct answers (${correctAnswers.length})',
                    results: correctAnswers.toList(),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            Button(
              label: 'Finish',
              onPressed: () => AutoRouter.of(context).popUntilRoot(),
              variat: ButtonVariant.elevatedExpanded,
            ),
          ],
        ),
      ),
    );
  }
}
