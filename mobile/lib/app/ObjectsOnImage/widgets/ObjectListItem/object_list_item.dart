import 'package:flutter/material.dart';
import 'package:mobile/app/ObjectsOnImage/domain/ObjectOnImage/object_on_image.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/widgets/list_item.dart';

class ObjectListItem extends StatelessWidget {
  const ObjectListItem(this.objectOnImage, {super.key});

  final ObjectOnImage objectOnImage;

  @override
  Widget build(BuildContext context) {
    return ListItem(
      onTap: () {},
      tileColor: AppColors.muted,
      label: objectOnImage.translatedName,
      sublabel: objectOnImage.name,
    );
  }
}
