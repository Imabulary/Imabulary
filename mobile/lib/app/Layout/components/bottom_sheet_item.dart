import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/atoms/type_setting.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,
    this.scanPhoto,
    required this.title,
    required this.icon,
    required this.source,
  });

  final String title;
  final IconData icon;
  final ImageSource source;
  final void Function(ImageSource source)? scanPhoto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: TypeSetting(title),
      onTap: () {
        scanPhoto != null ? scanPhoto!(source) : null;
      },
    );
  }
}
