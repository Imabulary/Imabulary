import 'package:flutter/material.dart';
import 'package:mobile/app/home.dart';
import 'package:mobile/app/profile.dart';

enum CurrentScreens {
  home(0),
  profile(1);

  const CurrentScreens(this.value);

  final int value;
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, this.currentScreen = 0});

  final int currentScreen;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static const _screens = [
    HomeScreen(),
    ProfileScreen(),
  ];

  void _navigate(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _screens[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[500],
      backgroundColor: const Color.fromRGBO(48, 48, 48, 1),
      onTap: _navigate,
      currentIndex: widget.currentScreen,
    );
  }
}
