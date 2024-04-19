import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sets_list_item_controller.g.dart';

@riverpod
class SetsListItemController extends _$SetsListItemController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future organize(String setId, String? flashcardId) async {
    if (flashcardId == null) return;

    final flashcardRepository = ref.watch(flashCardRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => flashcardRepository.organize(
        OrganizeFlashcardDTO(setId: setId, flashcardIds: [flashcardId]),
      ),
    );
  }
}
