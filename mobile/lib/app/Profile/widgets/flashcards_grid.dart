import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/app/Profile/presentation/profile_screen_controller.dart';
import 'package:mobile/widgets/flash_card_masonry_item.dart';

class FlashcardsGrid extends ConsumerStatefulWidget {
  const FlashcardsGrid({super.key});

  @override
  ConsumerState<FlashcardsGrid> createState() => _FlashcardsGridState();
}

class _FlashcardsGridState extends ConsumerState<FlashcardsGrid> {
  final _pagingController = PagingController<int, FlashCard>(firstPageKey: 1);

  @override
  void initState() {
    final findUserFlashcards =
        ref.read(profileScreenControllerProvider.notifier).findUserFlashcards;

    _pagingController.addPageRequestListener((pageKey) {
      findUserFlashcards(pageKey, _pagingController);
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
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedMasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<FlashCard>(
          itemBuilder: (context, item, index) => FlashCardMasonryItem(item),
        ),
      ),
    );
  }
}
