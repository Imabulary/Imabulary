import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Imabulary/app/Flashcard/application/flashcard_providers.dart';
import 'package:Imabulary/app/Flashcard/application/flashcard_service.dart';
import 'package:Imabulary/app/Flashcard/domain/card.dart';
import 'package:Imabulary/app/Flashcard/presentation/flashcard_screen.dart';
import 'package:Imabulary/app/Layout/components/better_results_dialog.dart';
import 'package:Imabulary/app/Layout/components/bottom_sheet_item.dart';
import 'package:Imabulary/app/Layout/widgets/AddBottomSheet/add_bottom_sheet_controller.dart';
import 'package:Imabulary/app/Wallet/application/wallet_providers.dart';
import 'package:Imabulary/atoms/type_setting.dart';
import 'package:Imabulary/utils/async_value_ui.dart';

class AddBottomSheet extends ConsumerWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(addBottomSheetControllerProvider, (_, state) {
      state.showLoadingDialog(context);
      state.showErrorDialog(context, true);

      state.whenData((value) {
        Navigator.pop(context);
        Navigator.pop(context);

        ref.invalidate(findAllFlashcardsProvider);
        ref.invalidate(getWalletBalanceProvider);

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
          icon: Icons.collections_outlined,
          title: 'Choose from gallery',
        ),
        ListTile(
          title: const TypeSetting('How to get better results?'),
          leading: const Icon(Icons.help_outline),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const BetterResultsDialog(),
            );
          },
        )
      ],
    );
  }
}
