import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen_controller.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Flashcard/widgets/SecondNegativeFeedbackDialog/second_negative_feedback_dialog.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/colors.dart';

class FlashcardFeedbackButton extends ConsumerStatefulWidget {
  const FlashcardFeedbackButton({
    super.key,
    required this.flashcard,
  });

  final FlashCard? flashcard;

  @override
  ConsumerState<FlashcardFeedbackButton> createState() =>
      _FlashcardFeedbackButtonState();
}

class _FlashcardFeedbackButtonState
    extends ConsumerState<FlashcardFeedbackButton> {
  var feedbackSent = false;

  void _handleDislike(
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
    feedbackSent = true;

    AutoRouter.of(context).push(const FeedbackRoute());
  }

  @override
  Widget build(BuildContext context) {
    final flashcard = ref.watch(flashcardServiceProvider);
    final state = ref.watch(feedbackScreenControllerProvider);
    final notifier = ref.watch(feedbackScreenControllerProvider.notifier);

    final isLoading = state.isLoading;
    final isError = state.hasError;

    final onLike = isLoading && !isError
        ? null
        : notifier.likeFlashcard(flashcard?.id ?? '');

    return AnimatedOpacity(
      opacity: flashcard?.is_touched ?? false ? 0 : 1,
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onLike == null
                  ? null
                  : () {
                      onLike();
                      feedbackSent = true;
                    },
              icon: const Icon(
                Icons.thumb_up_alt_outlined,
                size: 24,
                color: AppColors.black,
              ),
            ),
            Container(
              width: 48,
              height: 1,
              color: AppColors.black.withOpacity(0.1),
            ),
            IconButton(
              onPressed: () =>
                  _handleDislike(context, flashcard?.is_regenerated ?? false),
              icon: const Icon(
                Icons.thumb_down_alt_outlined,
                size: 24,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
