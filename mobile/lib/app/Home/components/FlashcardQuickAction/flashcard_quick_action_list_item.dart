import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/widgets/list_item.dart';

class FlashcardQuickActionListItem extends StatelessWidget {
  const FlashcardQuickActionListItem(
    this.label, {
    super.key,
    this.onTap,
  });

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListItem(
      label: label,
      onTap: onTap,
      tileColor: AppColors.darkYellow,
      textColor: Colors.black,
      leading: const Icon(
        Icons.add_photo_alternate_outlined,
        color: Colors.black,
        size: 40,
      ),
    );
  }
}
