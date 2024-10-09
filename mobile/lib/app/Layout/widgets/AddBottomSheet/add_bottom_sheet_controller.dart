import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/presentation/flashcard_screen.dart';
import 'package:mobile/app/ObjectsOnImage/domain/ObjectOnImage/object_on_image.dart';
import 'package:mobile/app/ObjectsOnImage/presentation/objects_on_image_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_bottom_sheet_controller.g.dart';

@riverpod
class AddBottomSheetController extends _$AddBottomSheetController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future scanPhoto(ImageSource source, BuildContext context) async {
    try {
      final flashCardRepository = ref.read(flashCardRepositoryProvider);

      final image = await flashCardRepository.pickPhoto(source);

      if (image == null) return;

      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        final scanResult = await flashCardRepository.scanPhoto(image);

        if (scanResult.isRight) {
          ref
              .read(flashcardServiceProvider.notifier)
              .openFlashcard(scanResult.right!);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FlashcardScreen(),
            ),
          );
        } else {
          final objectsOnImage = scanResult.left!.objectsOnImage
              .map(ObjectOnImage.fromJson)
              .toList();

          if (objectsOnImage.isEmpty) {
            // TODO: show a "No items were detected" dialog
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ObjectsOnImageScreen(
                objectsOnImage: objectsOnImage,
              ),
            ),
          );
        }
      });
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
