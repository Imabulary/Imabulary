import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objects_on_image_screen_controller.g.dart';

@riverpod
class ObjectsOnImageScreenController extends _$ObjectsOnImageScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> create(CreateFlashcardDTO createFlashcardDto) async {
    final flashCardRepository = ref.read(flashCardRepositoryProvider);
    final flashcardService = ref.read(flashcardServiceProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final flashcard = await flashCardRepository.create(createFlashcardDto);

        flashcardService.openFlashcard(flashcard);
      },
    );
  }
}
