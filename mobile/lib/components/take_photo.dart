import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({super.key});

  static ImagePicker picker = ImagePicker();

  void _takePhoto() async {
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    print(image);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.camera),
      title: const Text('Take a photo'),
      onTap: _takePhoto,
    );
  }
}
