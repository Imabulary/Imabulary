import 'package:flutter/material.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/constants.dart';

class ListItem extends ListTile {
  const ListItem({
    super.key,
    this.image,
    required this.label,
    this.sublabel,
    super.onTap,
    super.contentPadding,
    super.tileColor,
  });

  final String? image;
  final String label;
  final String? sublabel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: contentPadding,
      tileColor: tileColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          image ?? kStubImageUrl,
          width: 55,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: TypeSetting(
        label,
        variant: sublabel == null
            ? TextVariants.headlineMedium
            : TextVariants.bodyLarge,
      ),
      subtitle: sublabel != null
          ? TypeSetting(
              sublabel!,
              variant: TextVariants.bodySmall,
            )
          : null,
    );
  }
}
