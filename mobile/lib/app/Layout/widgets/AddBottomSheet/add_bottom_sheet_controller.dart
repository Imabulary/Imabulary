import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:mobile/app/Flashcard/domain/objectOnImage/object_on_image.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_bottom_sheet_controller.g.dart';

@riverpod
class AddBottomSheetController extends _$AddBottomSheetController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future scanPhoto(ImageSource source) async {
    try {
      final flashCardRepository = ref.read(flashCardRepositoryProvider);

      final image = await flashCardRepository.pickPhoto(source);

      if (image == null) return;

      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        final scanPhotoPayload = await flashCardRepository.scanPhoto(image);
        final objectsOnImage = scanPhotoPayload.translatedObjectsOnImage
            .map(ObjectOnImage.fromJson)
            .toList();

        if (objectsOnImage.length == 1) {
          // TODO: create a flashcard and return it
        }
      });
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
