import 'package:flutter/material.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/atoms/type_setting.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      const TypeSetting('Welcome to your profile!'),
      currentScreen: CurrentScreens.profile.value,
    );
  }
}
