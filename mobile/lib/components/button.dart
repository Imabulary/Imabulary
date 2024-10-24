import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

enum ButtonVariant { elevated, outlined, text }

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.variat = ButtonVariant.elevated,
    required this.label,
    required this.onPressed,
    this.disabled = false,
  });

  final ButtonVariant variat;
  final String label;
  final VoidCallback onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final onPress = disabled ? null : onPressed;
    final child = TypeSetting(
      label,
      style: TextStyle(
        color: disabled ? AppColors.disabledButtonTextColor : AppColors.primary,
      ),
    );

    // Styles
    final style = ElevatedButton.styleFrom(
      disabledBackgroundColor: AppColors.disabledButtonBackgroundColor,
    );
    final outlinedStyle = OutlinedButton.styleFrom(
      side: BorderSide(
        color: disabled
            ? AppColors.disabledButtonBackgroundColor
            : AppColors.primary,
      ),
    );

    switch (variat) {
      case ButtonVariant.elevated:
        return ElevatedButton(
          onPressed: onPress,
          child: child,
          style: style,
        );
      case ButtonVariant.outlined:
        return OutlinedButton(
          onPressed: onPress,
          child: child,
          style: outlinedStyle,
        );
      case ButtonVariant.text:
        return TextButton(
          onPressed: onPress,
          child: child,
        );
      default:
        return ElevatedButton(onPressed: onPress, child: child, style: style);
    }
  }
}
