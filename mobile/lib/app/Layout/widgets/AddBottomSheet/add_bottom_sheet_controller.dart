import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/Flashcard/application/flashcard_mixin.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_bottom_sheet_controller.g.dart';

@riverpod
class AddBottomSheetController extends _$AddBottomSheetController
    with FlashcardMixin {
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

        await redirectAfterImageProcessing(scanResult, ref, context);
      });
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
