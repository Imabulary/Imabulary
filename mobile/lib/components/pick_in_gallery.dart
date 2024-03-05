import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/atoms/type_setting.dart';

class PickInGallery extends StatelessWidget {
  const PickInGallery({super.key});

  static ImagePicker picker = ImagePicker();

  void _chooseImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    print(image);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.collections),
      title: const TypeSetting('Choose from gallery'),
      onTap: _chooseImage,
    );
  }
}
