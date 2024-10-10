import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/FlashCard/application/flashcard_providers.dart';
import 'package:mobile/app/FlashCard/presentation/flashcard_screen.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/domain/scanPhotoPayload/scan_photo_payload.dart';
import 'package:mobile/app/ObjectsOnImage/domain/ObjectOnImage/object_on_image.dart';
import 'package:mobile/app/ObjectsOnImage/widgets/ObjectListItem/object_list_item_controller.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/utils/async_value_ui.dart';
import 'package:mobile/widgets/list_item.dart';

class ObjectListItem extends ConsumerWidget {
  const ObjectListItem(this.objectOnImage,
      {super.key, required this.scanPhotoPayload});

  final ObjectOnImage objectOnImage;
  final ScanPhotoPayload scanPhotoPayload;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(objectListItemControllerProvider, (_, state) {
      state.showLoadingDialog(context, message: 'Creating your flashcard');
      state.showErrorDialog(context, false);

      state.whenData((value) {
        ref.invalidate(findAllFlashcardsProvider);
        ref.invalidate(getWalletBalanceProvider);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FlashcardScreen(),
          ),
        );
      });
    });

    final state = ref.watch(objectListItemControllerProvider);
    final create = state.isLoading
        ? null
        : ref.read(objectListItemControllerProvider.notifier).create;

    return ListItem(
      onTap: create != null
          ? () {
              create(
                CreateFlashcardDTO(
                  objectOnImage: objectOnImage.name,
                  imageUrl: scanPhotoPayload.imageUrl,
                  imageName: scanPhotoPayload.imageName,
                ),
              );
            }
          : null,
      tileColor: AppColors.muted,
      label: objectOnImage.translatedName,
      sublabel: objectOnImage.name,
      image: scanPhotoPayload.imageUrl,
    );
  }
}
