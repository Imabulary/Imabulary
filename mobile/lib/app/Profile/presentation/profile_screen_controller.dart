import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/fp.dart';
import 'package:mobile/utils/maybe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_screen_controller.g.dart';

// TODO: refactor controller by removing riverpod state notifier instantiation as it's useless
@riverpod
class ProfileScreenController extends _$ProfileScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future findUserFlashcards(
    int page,
    PagingController<int, FlashCard> pagingController,
  ) async {
    try {
      final flashCardsRepository = ref.watch(flashCardRepositoryProvider);

      final flashCards = await flashCardsRepository.findAll(
        Pagination(page: page, limit: 10),
      );

      _appendItemsToPage(flashCards, pagingController, page);
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future findUserSets(
    int page,
    PagingController<int, Set> pagingController,
  ) async {
    try {
      final setsRepository = ref.watch(setRepositoryProvider);

      final sets = await setsRepository.findAll(
        Pagination(page: page, limit: 10),
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
    final previouslyFetchedItemsAmount = Maybe.fromValue(
      pagingController.itemList?.length,
    ).map(identity).getOrElse(0) as int;

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
