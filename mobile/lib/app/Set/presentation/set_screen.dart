import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Quiz/domain/quiz.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/app/Set/widgets/flashcards_group_widget.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

@RoutePage()
class SetScreen extends ConsumerWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = ref.watch(setServiceProvider);
    final flashcards = ref.watch(findAllFlashcardsProvider(
      FindAllFlashcardsDTO(pagination: const Pagination(), setId: set?.id),
    ));

    return Layout(
      SingleChildScrollView(
        child: Column(
          children: [
            Button(
              onPressed: () => SetAppBarController.startQuiz(
                context,
                set?.flashcards,
              )(),
              label: 'Start quiz',
              variat: ButtonVariant.elevatedExpanded,
            ),
            const SizedBox(height: 12),
            flashcards.when(data: (flashcards) {
              final studiedFlashcards = flashcards.result.where((element) {
                return element.quizStatus?.name == QuizStatuses.mastered.name;
              });
              final notStudiedFlashcards = flashcards.result.where((element) {
                return element.quizStatus?.name ==
                    QuizStatuses.not_studied.name;
              });
              final learningFlashcards = flashcards.result.where((element) {
                return element.quizStatus?.name ==
                    QuizStatuses.still_learning.name;
              });
              return Column(
                children: [
                  if (notStudiedFlashcards.isNotEmpty)
                    FlashcardsGroupWidget(
                      flashCards: notStudiedFlashcards.toList(),
                      title: 'Not studied (${notStudiedFlashcards.length})',
                    ),
                  if (learningFlashcards.isNotEmpty)
                    FlashcardsGroupWidget(
                      flashCards: learningFlashcards.toList(),
                      title: 'Still learning (${learningFlashcards.length})',
                    ),
                  if (studiedFlashcards.isNotEmpty)
                    FlashcardsGroupWidget(
                      flashCards: studiedFlashcards.toList(),
                      title: 'Mastered (${studiedFlashcards.length})',
                    ),
                ],
              );
            }, error: (error, stackTrace) {
              return const SizedBox.shrink();
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ],
        ),
      ),
      appBar: const SetAppBar(),
    );
  }
}
