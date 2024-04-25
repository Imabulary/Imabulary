import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/app/FlashCard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/widgets/SetsListItem/sets_list_item.dart';
import 'package:mobile/app/Profile/presentation/profile_screen_controller.dart';
import 'package:mobile/app/Set/domain/set.dart';

class SetsList extends ConsumerStatefulWidget {
  const SetsList({super.key});

  @override
  ConsumerState<SetsList> createState() => _SetsListState();
}

class _SetsListState extends ConsumerState<SetsList> {
  final _pagingController = PagingController<int, Set>(firstPageKey: 1);

  @override
  void initState() {
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
    final flashcard = ref.watch(flashcardServiceProvider);

    return PagedListView(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Set>(
        itemBuilder: (context, item, _) =>
            SetsListItem(item, flashcard: flashcard),
      ),
      // separatorBuilder: (BuildContext context, _) => const SizedBox(
      //   height: 12,
      // ),
    );
  }
}
