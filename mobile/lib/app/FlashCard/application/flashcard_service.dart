import 'package:mobile/app/Flashcard/domain/card.dart';
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
