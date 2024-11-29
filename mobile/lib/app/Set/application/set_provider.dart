import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/utils/fp.dart';

final findAllSetsProvider = FutureProvider.autoDispose.family(
  (ref, Pagination pagination) =>
      ref.watch(setRepositoryProvider).findAll(pagination),
);

final findSetFlashcardsProvider = FutureProvider.autoDispose(
  (ref) async {
    final set = ref.watch(setServiceProvider);

    final flashcards = await ref.watch(flashCardRepositoryProvider).findAll(
          FindAllFlashcardsDTO(pagination: const Pagination(), setId: set?.id),
        );

    final groupedFlashcards = groupBy(
      flashcards.result,
      (flashcard) => flashcard.quizStatus?.name ?? 'other',
    );

    return groupedFlashcards;
  },
);
