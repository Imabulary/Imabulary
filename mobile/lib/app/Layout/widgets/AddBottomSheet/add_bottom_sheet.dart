import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Layout/components/bottom_sheet_item.dart';
import 'package:mobile/app/Layout/components/general_feedback_bottom_sheet.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet_controller.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/async_value_ui.dart';

class AddBottomSheet extends ConsumerWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(addBottomSheetControllerProvider, (_, state) {
      state.showLoadingDialog(context, message: 'Scanning your image...');
      state.showErrorDialog(context, true);

      state.whenData((value) {
        ref.invalidate(findAllFlashcardsProvider);
        ref.invalidate(getWalletBalanceProvider);
      });
    });

    final state = ref.watch(addBottomSheetControllerProvider);
    final scanPhoto = state.isLoading
        ? null
        : ref.read(addBottomSheetControllerProvider.notifier).scanPhoto;

    // TODO: It's prefferable to use Column, in this case
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
          title: const TypeSetting('Provide feedback'),
          leading: const Icon(Icons.feedback_outlined),
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => const GeneralFeedbackBottomSheet(),
            ).then((value) {
              Navigator.pop(context);
              if (value == true) {
                Flushbar(
                  dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                  borderRadius: BorderRadius.circular(8),
                  message: 'Thank you for helping us get better! 😊',
                  messageText: const TypeSetting(
                    'Thank you for helping us get better! 😊',
                  ),
                  duration: const Duration(seconds: 5),
                  flushbarPosition: FlushbarPosition.TOP,
                ).show(context);
              }
            });
          },
        ),
      ],
    );
  }
}
