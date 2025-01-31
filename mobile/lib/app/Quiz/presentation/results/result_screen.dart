import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Quiz/domain/quiz.dart';
import 'package:mobile/app/Quiz/domain/result.dart';
import 'package:mobile/app/Quiz/presentation/results/dialogs/quiz_feedback_dialog.dart';
import 'package:mobile/app/Quiz/presentation/results/widgets/flashcard_results_widget.dart';
import 'package:mobile/app/Set/application/set_provider.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/utils/fp.dart';

@RoutePage()
class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({
    super.key,
    required this.results,
    required this.flashcards,
  });

  final List<Result> results;
  final List<SetFlashcard> flashcards;

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(context: context, builder: (_) => const QuizFeedbackDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    final setFlashcards = ref.watch(findSetFlashcardsProvider);

    final correctAnswers =
        widget.results.where((result) => result.answer == result.correctAnswer);
    final wrongAnswers =
        widget.results.where((result) => result.answer != result.correctAnswer);

    return Layout(
      SingleChildScrollView(
        child: Builder(builder: (context) {
          return Column(
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
                    setFlashcards.when(
                      data: (groupedFlashcards) {
                        final flashcardsForQuiz =
                            groupedFlashcards[QuizStatuses.still_learning.name];

                        if (isSingle(flashcardsForQuiz)) {
                          return const SizedBox();
                        }

                        return Button(
                          label: 'Fix my mistake',
                          expanded: true,
                          onPressed: () {
                            AutoRouter.of(context).popUntilRoot();
                            SetAppBarController.startQuiz(
                              context,
                              widget.flashcards,
                              flashcardsForQuiz: groupedFlashcards[
                                  QuizStatuses.still_learning.name],
                            );
                          },
                        );
                      },
                      loading: () => const SizedBox(),
                      error: (error, stackTrace) => const SizedBox(),
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
                expanded: true,
              ),
            ],
          );
        }),
      ),
    );
  }
}
