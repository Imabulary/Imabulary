import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/FlashCard/application/flashcard_service.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/components/RemoveFlashcard/remove_flashcard_controller.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/async_value_ui.dart';

class RemoveFlashcard extends ConsumerWidget {
  const RemoveFlashcard({super.key, required this.flashcardId});

  final String flashcardId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(removeFlashcardControllerProvider, (_, state) {
      state.showErrorDialog(context, false);
      state.showLoadingDialog(context);
    });

    final set = ref.watch(setServiceProvider);

    final state = ref.watch(removeFlashcardControllerProvider);
    final isLoading = state.isLoading;
    final disorganize =
        ref.read(removeFlashcardControllerProvider.notifier).disorganize;
    final pagingController = ref.watch(flashcardPagingControllerProvider);

    final onTap = isLoading
        ? null
        : () => disorganize(set!.id, flashcardId).whenComplete(
              () {
                Navigator.pop(context);
                Navigator.pop(context);

                pagingController!.refresh();
              },
            );

    return ListTile(
      onTap: onTap,
      leading: const Icon(Icons.delete),
      title: const TypeSetting('Remove Flashcard'),
      subtitle: const TypeSetting(
        'Flashcard will be removed only from this set',
        variant: TextVariants.bodySmall,
      ),
    );
  }
}
