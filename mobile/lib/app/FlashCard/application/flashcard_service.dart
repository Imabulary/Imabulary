import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/app/FlashCard/domain/card/card.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcard_service.g.dart';

/// State might be `null` if user is not on the set page
@Riverpod(keepAlive: true)
class FlashcardService extends _$FlashcardService {
  @override
  FlashCard? build() {
    return null;
  }

  void openFlashcard(FlashCard flashCard) {
    state = flashCard;
  }
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
class FlashcardPagingController extends _$FlashcardPagingController {
  @override
  PagingController<int, FlashCard>? build() {
    return null;
  }

  void addController(PagingController<int, FlashCard> controller) {
    state = controller;
  }
}
