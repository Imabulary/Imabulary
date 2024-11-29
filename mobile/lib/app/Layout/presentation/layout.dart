import 'package:flutter/material.dart';
import 'package:mobile/app/Home/presentation/home.dart';
import 'package:mobile/app/Profile/presentation/profile_screen.dart';

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
    );
  }
}
