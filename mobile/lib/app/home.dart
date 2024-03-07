import 'package:flutter/material.dart';
import 'package:mobile/app/layout.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypeSetting(
            'Welcome to Imabulary!',
            variant: TextVariants.headlineLarge,
          ),
          SizedBox(
            height: 40,
          ),
          TypeSetting('Your latest scans'),
          SizedBox(
            height: 12,
          ),
        ],
      ),
      currentScreen: CurrentScreens.home.value,
    );
  }
}
