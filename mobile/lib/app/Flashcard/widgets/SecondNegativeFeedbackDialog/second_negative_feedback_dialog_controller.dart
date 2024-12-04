import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'second_negative_feedback_dialog_controller.g.dart';

@riverpod
class SecondNegativeFeedbackDialogController
    extends _$SecondNegativeFeedbackDialogController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future delete() async {
    final flashcard = ref.watch(flashcardServiceProvider);
    final flashcardRepository = ref.read(flashCardRepositoryProvider);

    if (flashcard == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => flashcardRepository.delete([flashcard.id]),
    );
  }
}
