import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen_controller.dart';
import 'package:mobile/app/Quiz/presentation/results/domain/quiz_feedback_level.dart';
import 'package:mobile/app/Quiz/presentation/results/widgets/quiz_feedback_emoji_tile.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class QuizFeedbackDialog extends ConsumerStatefulWidget {
  const QuizFeedbackDialog({super.key, required this.setId});

  final String setId;

  @override
  ConsumerState<QuizFeedbackDialog> createState() => _QuizFeedbackDialogState();
}

class _QuizFeedbackDialogState extends ConsumerState<QuizFeedbackDialog> {
  void sendFeedback(
    BuildContext context,
    QuizFeedbackLevel level,
  ) {
    ref.watch(feedbackScreenControllerProvider.notifier).submitQuizFeedback(
          level: level,
          setId: 'setId',
          screenSize: MediaQuery.sizeOf(context),
        );
    context.router.maybePop(true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TypeSetting(
            'Amazing! 🎉',
            style: TextStyle(color: AppColors.white),
            variant: TextVariants.headlineLarge,
          ),
          IconButton(
            onPressed: () => context.router.maybePop(),
            icon: const Icon(
              Icons.close,
              size: 24,
              color: AppColors.biege,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TypeSetting(
            'You finished your first quiz. How did you like it?',
            style: TextStyle(color: AppColors.lightGrey),
            variant: TextVariants.bodyMedium,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: QuizFeedbackLevel.values
                .map(
                  (level) => QuizFeedbackEmojiTile(
                    level: level,
                    onTap: () => sendFeedback(context, level),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
