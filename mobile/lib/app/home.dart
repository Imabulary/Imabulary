import 'package:flutter/material.dart';
import 'package:mobile/app/layout.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      const TypeSetting('Welcome to Imabulary!'),
      currentScreen: CurrentScreens.home.value,
    );
  }
}
