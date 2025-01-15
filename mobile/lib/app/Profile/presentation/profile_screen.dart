import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Profile/widgets/ProfileAppBar/profile_app_bar.dart';
import 'package:mobile/app/Profile/widgets/SetsGrid/sets_grid.dart';
import 'package:mobile/app/Profile/widgets/flashcards_grid.dart';

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
    super.initState();

    _tabController = TabController(
      length: 2,
      animationDuration: const Duration(milliseconds: 300),
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
  }

  @override
  void didUpdateWidget(covariant ProfileScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialTabIndex != _tabController.index) {
      _tabController.animateTo(widget.initialTabIndex);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileAppBar(_tabController),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FlashcardsGrid(
                    key: ValueKey('FlashcardsGrid'),
                  ),
                  SetsGrid(
                    key: ValueKey('SetsGrid'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
