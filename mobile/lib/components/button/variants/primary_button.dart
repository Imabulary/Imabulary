import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/components/button/button.dart';

class PrimaryButton extends Button {
  const PrimaryButton({
    super.key,
    super.onPressed,
    required this.child,
    super.icon,
    super.size,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final largeButtonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
    );
    final defaultButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.disabledButtonBackgroundColor,
    );

    final style = size == ButtonSize.large
        ? defaultButtonStyle.merge(largeButtonStyle)
        : defaultButtonStyle;

    if (icon != null) {
      ElevatedButton.icon(
        icon: Icon(icon),
        onPressed: onPressed,
        label: child,
        style: style,
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: style,
    );
  }
}
