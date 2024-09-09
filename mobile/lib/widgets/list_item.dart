import 'package:flutter/material.dart';
import 'package:Imabulary/atoms/type_setting.dart';
import 'package:Imabulary/shared/constants.dart';

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
      contentPadding: sublabel == null
          ? const EdgeInsets.all(10)
          : const EdgeInsets.only(left: 10, right: 10),
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
