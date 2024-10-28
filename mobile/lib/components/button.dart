import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

enum ButtonVariant { elevated, outlined, text, icon }

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.icon,
    this.label = '',
    this.variat = ButtonVariant.elevated,
    this.disabled = false,
  });

  final ButtonVariant variat;
  final String label;
  final void Function()? onPressed;
  final bool disabled;
  final IconData? icon;

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
    final iconColor =
        disabled ? AppColors.disabledButtonTextColor : Colors.white;

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
      case ButtonVariant.icon:
        return IconButton(
          onPressed: onPress,
          icon: Icon(
            icon,
            color: iconColor,
          ),
        );
      default:
        return ElevatedButton(onPressed: onPress, child: child, style: style);
    }
  }
}
