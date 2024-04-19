import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_bottom_sheet_controller.g.dart';

@riverpod
class AddBottomSheetController extends _$AddBottomSheetController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future scanPhoto(ImageSource source) async {
    final flashCardRepository = ref.read(flashCardRepositoryProvider);

    final image = await flashCardRepository.pickPhoto(source);

    if (image == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => flashCardRepository.scanPhoto(image));
  }
}
