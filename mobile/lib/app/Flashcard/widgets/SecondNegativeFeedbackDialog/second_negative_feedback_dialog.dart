import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/widgets/SecondNegativeFeedbackDialog/second_negative_feedback_dialog_controller.dart';
import 'package:mobile/components/button/button.dart';
import 'package:mobile/components/dialogs.dart';
import 'package:mobile/utils/async_value_ui.dart';

class SecondNegativeFeedbackDialog extends ConsumerWidget {
  const SecondNegativeFeedbackDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(secondNegativeFeedbackDialogControllerProvider, (_, state) {
      state.showErrorDialog(context, true);

      state.whenData((value) {
        final isFlashcardDeleted = value as bool;

        ref.invalidate(findAllFlashcardsProvider);

        if (isFlashcardDeleted) {
          AutoRouter.of(context).popUntilRoot();
        }
      });
    });

    final notifier = ref.read(
      secondNegativeFeedbackDialogControllerProvider.notifier,
    );
    final state = ref.watch(secondNegativeFeedbackDialogControllerProvider);

    final isLoading = state.isLoading;
    final isError = state.hasError;

    final onDelete = isLoading && !isError ? null : notifier.delete;

    return AppDialog(
      title: "Seems it's not quite what you expected...",
      content:
          "You have already provided negative feedback twice and we cannot regenerate the flashcard again. What do you want to do with the flashcard?",
      actions: [
        Button(
          onPressed: onDelete,
          variant: ButtonVariant.text,
          label: isLoading ? 'Deleting...' : 'Delete',
          disabled: isLoading,
        ),
        Button(
          onPressed: () => Navigator.pop(context),
          variant: ButtonVariant.outlined,
          label: 'Keep',
          disabled: isLoading,
        )
      ],
    );
  }
}
