import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/atoms/type_setting.dart';

class PickInGallery extends StatelessWidget {
  const PickInGallery({super.key, required this.pickPhoto});

  final void Function(ImageSource source) pickPhoto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.collections),
      title: const TypeSetting('Choose from gallery'),
      onTap: () {
        pickPhoto(ImageSource.gallery);
      },
    );
  }
}
