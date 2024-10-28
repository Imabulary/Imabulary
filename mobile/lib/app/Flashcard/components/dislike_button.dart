import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/widgets/SecondNegativeFeedbackDialog/second_negative_feedback_dialog.dart';
import 'package:mobile/components/button.dart';

class DislikeButton extends ConsumerWidget {
  const DislikeButton({super.key});

  _handleDislike(
    BuildContext context,
    bool isFlashcardRegenerated,
  ) {
    if (isFlashcardRegenerated) {
      showDialog(
        context: context,
        builder: (context) => const SecondNegativeFeedbackDialog(),
      );

      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FeedbackScreen()),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcard = ref.watch(flashcardServiceProvider);

    return Button(
      onPressed: () => _handleDislike(
        context,
        flashcard!.is_regenerated,
      ),
      icon: Icons.thumb_down_outlined,
      variat: ButtonVariant.icon,
    );
  }
}
