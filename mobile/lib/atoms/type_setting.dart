import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TextVariants {
  titleLarge,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  bodyLarge,
  labelLarge,
  bodyMedium,
  bodySmall
}

class TypeSetting extends Text {
  const TypeSetting(
    this.text, {
    super.key,
    super.style,
    super.textAlign,
    this.variant = TextVariants.bodyLarge,
  }) : super(text);

  final String text;
  final TextVariants variant;

  @override
  Widget build(BuildContext context) {
    final variants = {
      TextVariants.titleLarge: Theme.of(context).textTheme.titleLarge,
      TextVariants.headlineLarge: Theme.of(context).textTheme.headlineLarge,
      TextVariants.headlineMedium: Theme.of(context).textTheme.headlineMedium,
      TextVariants.headlineSmall: Theme.of(context).textTheme.headlineSmall,
      TextVariants.bodyLarge: Theme.of(context).textTheme.bodyLarge,
      TextVariants.bodyMedium: Theme.of(context).textTheme.bodyMedium,
      TextVariants.labelLarge: Theme.of(context).textTheme.labelLarge,
      TextVariants.bodySmall: Theme.of(context).textTheme.bodySmall,
    };

    return Text(
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
