import 'package:flutter/material.dart';
import 'package:Imabulary/app/Home/presentation/home.dart';
import 'package:Imabulary/app/Layout/widgets/bottom_navigation.dart';
import 'package:Imabulary/app/Layout/widgets/floating_button.dart';
import 'package:Imabulary/app/Profile/presentation/profile_screen.dart';

const screens = [
  HomeScreen(),
  ProfileScreen(),
];

class Layout extends StatelessWidget {
  const Layout(this.page, {super.key, this.currentScreen = 0, this.appBar});

  final Widget page;
  final int currentScreen;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: page,
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigation(
        screens: screens,
        currentScreen: currentScreen,
      ),
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
