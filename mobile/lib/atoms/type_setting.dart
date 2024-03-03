import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TextStyles {
  titleLarge,
  headlineLarge,
  headlineMedium,
  bodyLarge,
  labelLarge,
  bodySmall
}

class TypeSetting extends StatelessWidget {
  const TypeSetting(
    this.text, {
    Key? key,
    this.style = TextStyles.bodyLarge,
  }) : super(key: key);

  final String text;
  final TextStyles style;

  @override
  Widget build(BuildContext context) {
    final styles = {
      TextStyles.titleLarge: Theme.of(context).textTheme.titleLarge,
      TextStyles.headlineLarge: Theme.of(context).textTheme.headlineLarge,
      TextStyles.headlineMedium: Theme.of(context).textTheme.headlineMedium,
      TextStyles.bodyLarge: Theme.of(context).textTheme.bodyLarge,
      TextStyles.labelLarge: Theme.of(context).textTheme.labelLarge,
      TextStyles.bodySmall: Theme.of(context).textTheme.bodySmall,
    };

    return Text(
      text,
      style: styles[style]!.copyWith(
        color: Colors.white,
        fontFamily: GoogleFonts.sourceSans3().fontFamily,
      ),
    );
  }
}
