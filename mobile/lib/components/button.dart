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

enum ButtonColor { standard, danger }

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.icon,
    this.label = '',
    this.variat = ButtonVariant.elevated,
    this.disabled = false,
    this.expanded = false,
    this.customStyle,
    this.textStyle,
    this.color = ButtonColor.standard,
  });

  final ButtonVariant variat;
  final String label;
  final void Function()? onPressed;
  final bool disabled;
  final bool expanded;
  final IconData? icon;
  final ButtonColor color;
  final ButtonStyle? customStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final onPress = disabled ? null : onPressed;

    final Map<String, Color> backgroundColors = {
      ButtonColor.standard.name:
          Theme.of(context).colorScheme.surfaceContainerLow,
      ButtonColor.danger.name: Colors.red
    };

    final Map<String, Color> textColors = {
      ButtonColor.standard.name: AppColors.primary,
      ButtonColor.danger.name: Colors.white
    };

    final elevatedStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColors[color.name],
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

    final child = TypeSetting(
      label,
      style: textStyle ??
          TextStyle(
            color: disabled
                ? AppColors.disabledButtonTextColor
                : textColors[color.name],
          ),
    );

    switch (variat) {
      case ButtonVariant.elevated:
        return ElevatedButton.icon(
          icon: Icon(icon),
          onPressed: onPress,
          style: elevatedStyle.merge(customStyle),
          label: expanded
              ? SizedBox(width: double.infinity, child: Center(child: child))
              : child,
        );
      case ButtonVariant.outlined:
        return OutlinedButton.icon(
          icon: Icon(icon),
          onPressed: onPress,
          style: customStyle?.merge(outlinedStyle),
          label: expanded
              ? SizedBox(width: double.infinity, child: Center(child: child))
              : child,
        );
      case ButtonVariant.text:
        return TextButton.icon(
          icon: Icon(icon),
          onPressed: onPress,
          label: expanded
              ? SizedBox(width: double.infinity, child: Center(child: child))
              : child,
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
        return ElevatedButton(
          onPressed: onPress,
          style: elevatedStyle.merge(customStyle),
          child: expanded
              ? SizedBox(width: double.infinity, child: Center(child: child))
              : child,
        );
    }
  }
}
