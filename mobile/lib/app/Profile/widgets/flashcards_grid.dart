import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/app/FlashCard/application/flashcard_service.dart';
import 'package:mobile/app/FlashCard/domain/card/card.dart';
import 'package:mobile/app/Profile/presentation/profile_screen_controller.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/widgets/flash_card_masonry_item.dart';

class FlashcardsGrid extends ConsumerStatefulWidget {
  const FlashcardsGrid({super.key, this.setId, this.onGridItemLongPress});

  final String? setId;
  final void Function(String flashcardId)? onGridItemLongPress;

  @override
  ConsumerState<FlashcardsGrid> createState() => _FlashcardsGridState();
}

class _FlashcardsGridState extends ConsumerState<FlashcardsGrid> {
  final _pagingController = PagingController<int, FlashCard>(firstPageKey: 1);

  @override
  void initState() {
    Future(() {
      ref
          .read(flashcardPagingControllerProvider.notifier)
          .addController(_pagingController);
    });

    final findUserFlashcards =
        ref.read(profileScreenControllerProvider.notifier).findUserFlashcards;

    _pagingController.addPageRequestListener((pageKey) {
      findUserFlashcards(pageKey, _pagingController, setId: widget.setId);
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
        () {
          ref.invalidate(getWalletBalanceProvider);
          _pagingController.refresh();
        },
      ),
      // TODO: add tests for the case when data is presented. Additionally, add builder for the case when data is empty
      child: PagedMasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<FlashCard>(
          itemBuilder: (context, item, index) => FlashCardMasonryItem(
            item,
            onLongPress: widget.onGridItemLongPress,
          ),
        ),
      ),
    );
  }
}
