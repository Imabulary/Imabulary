import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/widgets/SecondNegativeFeedbackDialog/second_negative_feedback_dialog.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/utils/analytics_engine.dart';

class DislikeButton extends ConsumerWidget {
  const DislikeButton({super.key});

  _handleDislike(
    BuildContext context,
    bool isFlashcardRegenerated,
  ) {
    analyticsEngine.trackClick(AnalyticClickEvents.flashcardDislike);
    if (isFlashcardRegenerated) {
      showDialog(
        context: context,
        builder: (context) => const SecondNegativeFeedbackDialog(),
      );

      return;
    }

    AutoRouter.of(context).push(const FeedbackRoute());
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
