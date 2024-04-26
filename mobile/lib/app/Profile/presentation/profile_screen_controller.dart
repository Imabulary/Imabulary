import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:mobile/app/Flashcard/domain/card.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_screen_controller.g.dart';

@riverpod
class ProfileScreenController extends _$ProfileScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future findUserFlashcards(
    int page,
    PagingController<int, FlashCard> pagingController, {
    String? setId,
  }) async {
    try {
      final flashCardsRepository = ref.watch(flashCardRepositoryProvider);

      final flashcards = await flashCardsRepository.findAll(
        FindAllFlashcardsDTO(pagination: Pagination(page: page), setId: setId),
      );

      _appendItemsToPage(flashcards, pagingController, page);
    } catch (error) {
      pagingController.error = error;
    }
  }

  // TODO: Add tests
  Future findUserSets(
    int page,
    PagingController<int, Set> pagingController,
  ) async {
    try {
      final setsRepository = ref.watch(setRepositoryProvider);

      final sets = await setsRepository.findAll(
        Pagination(page: page),
      );

      _appendItemsToPage(sets, pagingController, page);
    } catch (error) {
      pagingController.error = error;
    }
  }

  void _appendItemsToPage(
    ServerResponse data,
    PagingController pagingController,
    int page,
  ) {
    final previouslyFetchedItemsAmount = pagingController.itemList?.length ?? 0;

    final isLastPage = data.isLastPage(previouslyFetchedItemsAmount);
    final newItems = data.result;

    if (isLastPage) {
      pagingController.appendLastPage(newItems);
    } else {
      final nextPageKey = page + 1;
      pagingController.appendPage(newItems, nextPageKey);
    }
  }
}
