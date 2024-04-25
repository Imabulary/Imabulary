import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/app/Profile/presentation/profile_screen_controller.dart';
import 'package:mobile/app/Profile/widgets/SetsGrid/sets_grid_controller.dart';
import 'package:mobile/app/Profile/widgets/no_sets.dart';
import 'package:mobile/app/Profile/widgets/set_grid_item.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class SetsGrid extends ConsumerStatefulWidget {
  const SetsGrid({super.key});

  @override
  ConsumerState<SetsGrid> createState() => _SetsGridState();
}

class _SetsGridState extends ConsumerState<SetsGrid> {
  final _pagingController = PagingController<int, Set>(firstPageKey: 1);

  @override
  void initState() {
    Future(() {
      ref
          .read(setsPagingControllerProvider.notifier)
          .addController(_pagingController);
    });

    final findUserSets =
        ref.read(profileScreenControllerProvider.notifier).findUserSets;

    _pagingController.addPageRequestListener((pageKey) {
      findUserSets(pageKey, _pagingController);
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: SetsGridController.showSetFormBottomSheet(context),
          icon: const Icon(Icons.add),
          label: const TypeSetting(
            'Create new set',
            style: TextStyle(color: AppColors.primary),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: RefreshIndicator(
            // TODO: Add tests for 2 states: data is presented and not presented. Example on writing tests: https://github.com/EdsonBueno/infinite_scroll_pagination/tree/master/test
            child: PagedMasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Set>(
                itemBuilder: (context, item, index) => SetGridItem(set: item),
                noItemsFoundIndicatorBuilder: (context) => const NoSets(),
              ),
            ),
            onRefresh: () => Future.sync(
              () => _pagingController.refresh(),
            ),
          ),
        ),
      ],
    );
  }
}
