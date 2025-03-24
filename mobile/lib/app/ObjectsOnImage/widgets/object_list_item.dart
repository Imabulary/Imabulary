import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/domain/scanPhotoPayload/scan_photo_payload.dart';
import 'package:mobile/app/ObjectsOnImage/domain/ObjectOnImage/object_on_image.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/utils/analytics_engine.dart';
import 'package:mobile/widgets/list_item.dart';

class ObjectListItem extends StatelessWidget {
  const ObjectListItem(
    this.objectOnImage, {
    super.key,
    required this.scanPhotoPayload,
    this.create,
  });

  final ObjectOnImage objectOnImage;
  final ScanPhotoPayload scanPhotoPayload;
  final Future<void> Function(CreateFlashcardDTO)? create;

  @override
  Widget build(BuildContext context) {
    return ListItem(
      onTap: create != null
          ? () {
              analyticsEngine.trackClick(
                AnalyticClickEvents.selectObjectInPhotoChooseObject,
                {
                  'object_on_image': objectOnImage.name,
                  'image_name': scanPhotoPayload.imageName,
                },
              );
              create!(
                CreateFlashcardDTO(
                  objectOnImage: objectOnImage.name,
                  imageUrl: scanPhotoPayload.imageUrl,
                  imageName: scanPhotoPayload.imageName,
                  isRegeneration: scanPhotoPayload.isRegeneration,
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
