import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/presentation/home.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Profile/presentation/profile_screen.dart';

import '../../Layout/widgets/FloatingButton/floating_button.dart';
import '../application/main_provider.dart';

@RoutePage()
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainTabNavigatorState();
}

class _MainTabNavigatorState extends ConsumerState<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  InitialProfileIndex initialProfileIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentTabIndexProvider);

    ref.listen<(int, InitialProfileIndex)>(currentTabIndexProvider,
        (previousIndex, newIndex) {
      if (newIndex.$1 != _tabController.index) {
        setState(() {
          initialProfileIndex = newIndex.$2;
          _tabController.index = newIndex.$1;
        });
      }
    });

    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          const HomeScreen(),
          ProfileScreen(
              key: const ValueKey('ProfileScreen'),
              initialTabIndex: initialProfileIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentScreen: CurrentScreen.values[currentIndex.$1],
        onNewScreenSelected: (newScreen) {
          ref.read(currentTabIndexProvider.notifier).state =
              (newScreen.value, 0);
        },
      ),
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
