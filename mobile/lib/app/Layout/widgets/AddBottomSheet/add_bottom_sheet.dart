import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/FlashCard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/domain/card.dart';
import 'package:mobile/app/Flashcard/presentation/flashcard.dart';
import 'package:mobile/app/Layout/components/bottom_sheet_item.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet_controller.dart';
import 'package:mobile/utils/async_value_ui.dart';

class AddBottomSheet extends ConsumerWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(addBottomSheetControllerProvider, (_, state) {
      state.showLoadingDialog(context);
      state.showErrorDialog(context, true);

      state.whenData((value) {
        final flashcard = value as FlashCard;

        ref.read(flashcardServiceProvider.notifier).openFlashcard(flashcard);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FlashcardScreen(),
          ),
        );
      });
    });

    final state = ref.watch(addBottomSheetControllerProvider);
    final scanPhoto = state.isLoading
        ? null
        : ref.read(addBottomSheetControllerProvider.notifier).scanPhoto;

    return ListView(
      shrinkWrap: true,
      children: [
        BottomSheetItem(
          source: ImageSource.camera,
          scanPhoto: scanPhoto,
          icon: Icons.camera,
          title: 'Take a photo',
        ),
        BottomSheetItem(
          source: ImageSource.gallery,
          scanPhoto: scanPhoto,
          icon: Icons.collections,
          title: 'Choose from gallery',
        ),
      ],
    );
  }
}
