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
    super.textColor,
    super.leading,
    super.enabled,
  });

  final String? image;
  final String label;
  final String? sublabel;

  @override
  Widget build(BuildContext context) {
    final sublabelPadding = sublabel == null
        ? const EdgeInsets.all(10)
        : const EdgeInsets.only(left: 10, right: 10);
    final padding = contentPadding != null ? contentPadding : sublabelPadding;

    return ListTile(
      enabled: enabled,
      onTap: onTap,
      contentPadding: padding,
      tileColor: tileColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: leading != null
          ? leading
          : ClipRRect(
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
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
      subtitle: sublabel != null
          ? TypeSetting(sublabel!,
              variant: TextVariants.bodySmall,
              style: TextStyle(color: textColor))
          : null,
    );
  }
}
