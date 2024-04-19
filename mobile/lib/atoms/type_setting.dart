import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/atoms/colors.dart';

enum TextVariants {
  titleLarge,
  headlineLarge,
  headlineMedium,
  bodyLarge,
  labelLarge,
  bodySmall
}

class TypeSetting extends Text {
  const TypeSetting(
    this.text, {
    super.key,
    super.style,
    super.textAlign,
    this.variant = TextVariants.bodyLarge,
    this.color,
  }) : super(text);

  final String text;
  final String? color;
  final TextVariants variant;

  @override
  Widget build(BuildContext context) {
    final variants = {
      TextVariants.titleLarge: Theme.of(context).textTheme.titleLarge,
      TextVariants.headlineLarge: Theme.of(context).textTheme.headlineLarge,
      TextVariants.headlineMedium: Theme.of(context).textTheme.headlineMedium,
      TextVariants.bodyLarge: Theme.of(context).textTheme.bodyLarge,
      TextVariants.labelLarge: Theme.of(context).textTheme.labelLarge,
      TextVariants.bodySmall: Theme.of(context).textTheme.bodySmall,
    };

    final colorVariants = {
      'primary': colors['primary'],
    };

    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: variants[variant]!.copyWith(
        color: style?.color ?? colorVariants[color] ?? Colors.white,
        fontWeight: style?.fontWeight,
        fontFamily: GoogleFonts.sourceSans3().fontFamily,
      ),
    );
  }
}
