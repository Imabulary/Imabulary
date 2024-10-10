import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/domain/scanPhotoPayload/scan_photo_payload.dart';
import 'package:mobile/app/ObjectsOnImage/domain/ObjectOnImage/object_on_image.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/ObjectsOnImage/widgets/NoDesiredObject/no_desired_object.dart';
import 'package:mobile/app/ObjectsOnImage/widgets/ObjectListItem/object_list_item.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class ObjectsOnImageScreen extends StatelessWidget {
  const ObjectsOnImageScreen({
    super.key,
    required this.objectsOnImage,
    required this.scanPhotoPayload,
  });

  final List<ObjectOnImage> objectsOnImage;
  final ScanPhotoPayload scanPhotoPayload;

  @override
  Widget build(BuildContext context) {
    return Layout(
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TypeSetting(
              'Select an object',
              variant: TextVariants.headlineLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            TypeSetting(
              'We’ve a detected a few objects on your photo. Please select one item and we’ll generate the flashcard for it.',
              style: TextStyle(color: AppColors.lightGrey),
            ),
            const SizedBox(
              height: 24,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ObjectListItem(
                objectsOnImage[index],
                scanPhotoPayload: scanPhotoPayload,
              ),
              itemCount: objectsOnImage.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 12),
            ),
            const SizedBox(height: 12),
            const NoDesiredObject(),
          ],
        ),
      ),
    );
  }
}
