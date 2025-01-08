import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/atoms/colors.dart';

enum TextVariants {
  titleLarge,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  bodyLarge,
  labelLarge,
  bodySmall,
  link
}

class TypeSetting extends Text {
  const TypeSetting(
    this.text, {
    super.key,
    super.style,
    super.textAlign,
    this.variant = TextVariants.bodyLarge,
    this.onTap,
  }) : super(text);

  final String text;
  final TextVariants variant;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final variants = {
      TextVariants.titleLarge: Theme.of(context).textTheme.titleLarge,
      TextVariants.headlineLarge: Theme.of(context).textTheme.headlineLarge,
      TextVariants.headlineMedium: Theme.of(context).textTheme.headlineMedium,
      TextVariants.headlineSmall: Theme.of(context).textTheme.headlineSmall,
      TextVariants.bodyLarge: Theme.of(context).textTheme.bodyLarge,
      TextVariants.labelLarge: Theme.of(context).textTheme.labelLarge,
      TextVariants.bodySmall: Theme.of(context).textTheme.bodySmall,
    };

    return variant == TextVariants.link
        ? RichText(
            textAlign: textAlign ?? TextAlign.left,
            text: TextSpan(children: [
              TextSpan(
                text: text,
                style: variants[TextVariants.bodyLarge]!.copyWith(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                  fontFamily: GoogleFonts.sourceSans3().fontFamily,
                ),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              )
            ]),
          )
        : Text(
            text,
            textAlign: textAlign ?? TextAlign.left,
            style: variants[variant]!.copyWith(
              color: style?.color ?? Colors.white,
              fontWeight: style?.fontWeight,
              fontStyle: style?.fontStyle,
              fontFamily: GoogleFonts.sourceSans3().fontFamily,
            ),
          );
  }
}
