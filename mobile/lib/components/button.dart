import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

enum ButtonVariant {
  elevatedExpanded,
  elevated,
  outlined,
  text,
  icon,
  textIcon,
}

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
          style: style,
          child: child,
        );
      case ButtonVariant.elevatedExpanded:
        return ElevatedButton(
          onPressed: onPress,
          style: style,
          child: SizedBox(width: double.infinity, child: Center(child: child)),
        );
      case ButtonVariant.outlined:
        return OutlinedButton(
          onPressed: onPress,
          style: outlinedStyle,
          child: child,
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
      case ButtonVariant.textIcon:
        return TextButton(
          onPressed: onPress,
          style: TextButton.styleFrom(foregroundColor: AppColors.darkYellow),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.darkYellow),
              ),
            ],
          ),
        );
      default:
        return ElevatedButton(onPressed: onPress, style: style, child: child);
    }
  }
}
