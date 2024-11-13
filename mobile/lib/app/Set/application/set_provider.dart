import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Quiz/data/quiz_repository.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

final findAllSetsProvider = FutureProvider.autoDispose.family(
  (ref, Pagination pagination) =>
      ref.watch(setRepositoryProvider).findAll(pagination),
);

// TODO: merge next 2 methods and use controller to fetch quizStatuses and sets
final findInProgressSetsProvider = FutureProvider.autoDispose((ref) async {
  final quizStatuses =
      await ref.watch(quizRepositoryProvider).findAllStatuses();

  final sets = await ref.watch(setRepositoryProvider).findAll(const Pagination());

  return sets.result
      .where(
        (set) =>
            set.flashcards!.isNotEmpty &&
            set.flashcards!.length >= kMinimalAmountOfFlashcardsToStartQuiz &&
            set.flashcards!.any(
              (flashcard) =>
                  flashcard.quizStatusId == quizStatuses.stillLearning.id,
            ),
      )
      .toList();
});

final findNotStudiedSetsProvider = FutureProvider.autoDispose((ref) async {
  final quizStatuses =
      await ref.watch(quizRepositoryProvider).findAllStatuses();

  final sets = await ref.watch(setRepositoryProvider).findAll(const Pagination());

  return sets.result
      .where(
        (set) =>
            set.flashcards!.isNotEmpty &&
            set.flashcards!.length >= kMinimalAmountOfFlashcardsToStartQuiz &&
            set.flashcards!.every(
              (flashcard) =>
                  flashcard.quizStatusId == quizStatuses.notStudied.id,
            ),
      )
      .toList();
});
