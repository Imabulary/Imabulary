import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/atoms/type_setting.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({super.key, required this.pickPhoto});

  final void Function(ImageSource source) pickPhoto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.camera),
      title: const TypeSetting('Take a photo'),
      onTap: () {
        pickPhoto(ImageSource.camera);
      },
    );
  }
}
