import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/FlashCard/domain/card/card.dart';
import 'package:mobile/app/FlashCard/widgets/SetsListItem/sets_list_item_controller.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/async_value_ui.dart';
import 'package:mobile/widgets/list_item.dart';

class SetsListItem extends ConsumerWidget {
  const SetsListItem(this.set, {super.key, this.flashcard});

  final Set set;
  final FlashCard? flashcard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(setsListItemControllerProvider, (_, state) {
      state.showLoadingDialog(
        context,
        message: 'Flashcard is being organized...',
      );
      state.showErrorDialog(context, true);
    });

    final state = ref.watch(setsListItemControllerProvider);
    final isLoading = state.isLoading;

    final organize = ref.read(setsListItemControllerProvider.notifier).organize;

    final onTap = isLoading
        ? null
        : () => organize(set.id, flashcard?.id).whenComplete(
              () {
                Navigator.pop(context);
                Navigator.pop(context);

                Flushbar(
                  dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                  borderRadius: BorderRadius.circular(8),
                  message: 'Flashcard is successfully organized!',
                  messageText: const TypeSetting(
                    'Flashcard is successfully organized!',
                  ),
                  duration: const Duration(seconds: 5),
                  flushbarPosition: FlushbarPosition.TOP,
                ).show(context);
              },
            );

    return ListItem(
      onTap: onTap,
      label: set.name,
      image: set.flashcards?.isNotEmpty == true
          ? set.flashcards![0].image_url
          : null,
    );
  }
}
