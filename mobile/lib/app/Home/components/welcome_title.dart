import 'package:flutter/material.dart';
import 'package:mobile/atoms/type_setting.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({super.key, this.customTitle});

  final String? customTitle;

  @override
  Widget build(BuildContext context) {
    return TypeSetting(
      customTitle ?? "Welcome 👋",
      variant: TextVariants.headlineLarge,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
