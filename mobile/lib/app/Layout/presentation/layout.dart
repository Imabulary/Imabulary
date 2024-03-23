import 'package:flutter/material.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Layout/widgets/floating_button.dart';

class Layout extends StatelessWidget {
  const Layout(this.page, {super.key, this.currentScreen = 0});

  final Widget page;
  final int currentScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: page,
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigation(
        currentScreen: currentScreen,
      ),
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
