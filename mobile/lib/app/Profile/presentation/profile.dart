import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Profile/presentation/profile_screen_controller.dart';
import 'package:mobile/app/Profile/widgets/ProfileAppBar/profile_app_bar.dart';
import 'package:mobile/widgets/flash_card_masonry_item.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  final _pagingController = PagingController<int, FlashCard>(firstPageKey: 1);
  late TabController _tabController;

  @override
  void initState() {
    final findUserFlashcards =
        ref.read(profileScreenControllerProvider.notifier).findUserFlashcards;

    _pagingController.addPageRequestListener((pageKey) {
      findUserFlashcards(pageKey, _pagingController);
    });

    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      TabBarView(
        controller: _tabController,
        children: [
          RefreshIndicator(
            onRefresh: () => Future.sync(
              () => _pagingController.refresh(),
            ),
            child: PagedMasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<FlashCard>(
                itemBuilder: (context, item, index) =>
                    FlashCardMasonryItem(item),
              ),
            ),
          ),
        ],
      ),
      currentScreen: CurrentScreens.profile.value,
      appBar: ProfileAppBar(_tabController),
    );
  }
}
