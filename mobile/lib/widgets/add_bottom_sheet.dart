import 'package:flutter/material.dart';
import 'package:mobile/components/pick_in_gallery.dart';
import 'package:mobile/components/take_photo.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [TakePhoto(), PickInGallery()],
    );
  }
}
