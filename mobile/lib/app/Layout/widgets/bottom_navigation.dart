import 'package:flutter/material.dart';

enum CurrentScreen {
  home(0),
  profile(1);

  const CurrentScreen(this.value);

  final int value;
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    this.currentScreen = CurrentScreen.home,
    required this.onNewScreenSelected,
  });

  final CurrentScreen currentScreen;
  final void Function(CurrentScreen) onNewScreenSelected;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[500],
      backgroundColor: const Color.fromRGBO(48, 48, 48, 1),
      onTap: (index) {
        onNewScreenSelected(
          CurrentScreen.values.where((screen) => screen.value == index).first,
        );
      },
      currentIndex: currentScreen.value,
    );
  }
}
