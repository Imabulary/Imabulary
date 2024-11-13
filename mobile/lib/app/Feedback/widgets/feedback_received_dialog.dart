import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/widgets/feedback_received_dialog_controller.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/utils/async_value_ui.dart';

class FeedbackReceivedDialog extends ConsumerStatefulWidget {
  const FeedbackReceivedDialog({super.key});

  @override
  ConsumerState<FeedbackReceivedDialog> createState() =>
      _FeedbackReceivedDialogState();
}

class _FeedbackReceivedDialogState
    extends ConsumerState<FeedbackReceivedDialog> {
  _navigateHome() {
    AutoRouter.of(context).popUntilRoot();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(feedbackReceivedDialogControllerProvider, (_, state) {
      state.showErrorDialog(context, true);

      state.whenData((value) {
        ref.invalidate(findAllFlashcardsProvider);
      });
    });

    final notifier = ref.read(
      feedbackReceivedDialogControllerProvider.notifier,
    );
    final state = ref.watch(feedbackReceivedDialogControllerProvider);

    final isError = state.hasError;
    final isLoading = state.isLoading;

    final onRegenerate =
        isLoading && !isError ? null : notifier.regenerate(context);

    final regenerateButtonText = isLoading ? 'Generating...' : 'Generate Again';

    return AlertDialog(
      title: const TypeSetting(
        'Thank you for the feedback!',
        variant: TextVariants.headlineLarge,
      ),
      content: const TypeSetting(
        'We have returned the coin to you. What do you want to do next?',
      ),
      actions: [
        Button(
          label: 'Return Home',
          onPressed: _navigateHome,
          variat: ButtonVariant.text,
          disabled: isLoading,
        ),
        Button(
          label: regenerateButtonText,
          onPressed: onRegenerate,
          variat: ButtonVariant.outlined,
          disabled: isLoading,
        ),
      ],
    );
  }
}
