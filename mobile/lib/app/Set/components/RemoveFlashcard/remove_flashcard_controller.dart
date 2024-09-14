import 'package:mobile/app/FlashCard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_flashcard_controller.g.dart';

@riverpod
class RemoveFlashcardController extends _$RemoveFlashcardController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future disorganize(String setId, String? flashcardId) async {
    if (flashcardId == null) return;

    final flashcardRepository = ref.watch(flashCardRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => flashcardRepository.disorganize(
        OrganizeFlashcardDTO(setId: setId, flashcardIds: [flashcardId]),
      ),
    );
  }
}
