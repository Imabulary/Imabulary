import 'dart:async';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/utils/fp.dart';
import 'package:mobile/utils/maybe.dart';
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
    PagingController<int, FlashCard> pagingController,
  ) async {
    try {
      final flashCardsRepository = ref.watch(flashCardRepositoryProvider);

      final previouslyFetchedItemsCount = Maybe.fromValue(
        pagingController.itemList?.length,
      ).map(identity).getOrElse(0) as int;

      final flashCards = await flashCardsRepository.findAll(
        Pagination(page: page, limit: 10),
      );

      final isLastPage = flashCards.isLastPage(previouslyFetchedItemsCount);
      final newItems = flashCards.result;

      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
