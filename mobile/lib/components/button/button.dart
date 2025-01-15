import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button/variants/primary_button.dart';

enum ButtonVariant {
  primary,
  elevated,
  outlined,
  text,
  icon,
  textIcon,
}

enum ButtonColor { standard, danger }

enum ButtonSize { large, medium }

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.icon,
    this.label = '',
    this.variant = ButtonVariant.elevated,
    this.disabled = false,
    this.expanded = false,
    this.customStyle,
    this.textStyle,
    this.color = ButtonColor.standard,
    this.size = ButtonSize.medium,
  });

  final ButtonVariant variant;
  final String label;
  final void Function()? onPressed;
  final bool disabled;
  final bool expanded;
  final IconData? icon;
  final ButtonColor color;
  final ButtonStyle? customStyle;
  final TextStyle? textStyle;
  final ButtonSize? size;

  @override
  Widget build(BuildContext context) {
    final onPress = disabled ? null : onPressed;

    final Map<String, Color> textColors = {
      ButtonColor.standard.name: AppColors.primary,
      ButtonColor.danger.name: Colors.white
    };

    final elevatedStyle = ElevatedButton.styleFrom(
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

    final defaultButtonColor = variant == ButtonVariant.primary
        ? Colors.black
        : textColors[color.name];

    final defaultChild = TypeSetting(
      label,
      variant: size == ButtonSize.large
          ? TextVariants.headlineMedium
          : TextVariants.bodyLarge,
      style: textStyle ??
          TextStyle(
            color: disabled
                ? AppColors.disabledButtonTextColor
                : defaultButtonColor,
          ),
    );

    final extendedChild =
        SizedBox(width: double.infinity, child: Center(child: defaultChild));

    final child = expanded ? extendedChild : defaultChild;

    switch (variant) {
      case ButtonVariant.primary:
        return PrimaryButton(
          child: child,
          onPressed: onPress,
          icon: icon,
          size: size,
        );
      case ButtonVariant.elevated:
        return ElevatedButton(
          onPressed: onPress,
          style: elevatedStyle.merge(customStyle),
          child: child,
        );
      case ButtonVariant.outlined:
        return OutlinedButton(
          onPressed: onPress,
          style: customStyle?.merge(outlinedStyle),
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
      default:
        return ElevatedButton(
          onPressed: onPress,
          style: elevatedStyle.merge(customStyle),
          child: child,
        );
    }
  }
}
