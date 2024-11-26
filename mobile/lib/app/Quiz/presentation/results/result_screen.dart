import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Quiz/domain/result.dart';
import 'package:mobile/app/Quiz/presentation/results/widgets/flashcard_results_widget.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

@RoutePage()
class ResultScreen extends ConsumerWidget {
  const ResultScreen({
    super.key,
    required this.results,
    required this.flashcards,
  });

  final List<Result> results;
  final List<SetFlashcard> flashcards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allFlashcards = ref.read(findAllFlashcardsProvider(
      const FindAllFlashcardsDTO(pagination: Pagination()),
    )).value?.result ?? [];

    final correctAnswers =
        results.where((result) => result.answer == result.correctAnswer);
    final wrongAnswers =
        results.where((result) => result.answer != result.correctAnswer);

    final wrongFlashcards = allFlashcards.where((flashcard) {
      return wrongAnswers.where((wrongAnswer) => wrongAnswer.flashcardId == flashcard.id).isNotEmpty;
    },);

    return Layout(
      SingleChildScrollView(
        child: Builder(
          builder: (context) {
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
                      Button(
                        label: 'Fix my mistake',
                        onPressed: () {
                          AutoRouter.of(context).popUntilRoot();
                          SetAppBarController.startQuiz(context, flashcards, flashcardsForQuiz: wrongFlashcards.toList());
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
            );
          }
        ),
      ),
    );
  }
}
