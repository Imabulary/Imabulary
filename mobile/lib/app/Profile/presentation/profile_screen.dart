import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Layout/presentation/layout.dart';
import 'package:Imabulary/app/Layout/widgets/bottom_navigation.dart';
import 'package:Imabulary/app/Profile/widgets/ProfileAppBar/profile_app_bar.dart';
import 'package:Imabulary/app/Profile/widgets/SetsGrid/sets_grid.dart';
import 'package:Imabulary/app/Profile/widgets/flashcards_grid.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key, this.initialTabIndex = 0});

  final int initialTabIndex;

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      TabBarView(
        controller: _tabController,
        children: const [FlashcardsGrid(), SetsGrid()],
      ),
      currentScreen: CurrentScreens.profile.value,
      appBar: ProfileAppBar(
        _tabController,
      ),
    );
  }
}
