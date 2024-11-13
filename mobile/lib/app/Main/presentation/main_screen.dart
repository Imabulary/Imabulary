import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/presentation/home.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Profile/presentation/profile_screen.dart';

import '../../Layout/widgets/floating_button.dart';
import '../application/main_provider.dart';

@RoutePage()
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainTabNavigatorState();
}

class _MainTabNavigatorState extends ConsumerState<MainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _pages = const [
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentTabIndexProvider);

    ref.listen<int>(currentTabIndexProvider, (previousIndex, newIndex) {
      if (newIndex != _tabController.index) {
        _tabController.index = newIndex;
      }
    });

    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigation(
        currentScreen: CurrentScreen.values[currentIndex],
        onNewScreenSelected: (newScreen) {
          ref.read(currentTabIndexProvider.notifier).state = newScreen.value;
        },
      ),
      floatingActionButton: FloatingButton(onPressed: _showAddBottomSheet),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  void _showAddBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      builder: (context) => const AddBottomSheet(),
    );
  }
}
