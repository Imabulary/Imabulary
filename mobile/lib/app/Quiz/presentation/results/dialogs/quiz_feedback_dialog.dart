import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen_controller.dart';
import 'package:mobile/app/Quiz/presentation/results/domain/quiz_feedback_level.dart';
import 'package:mobile/app/Quiz/presentation/results/widgets/quiz_feedback_emoji_tile.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/dialogs.dart';

class QuizFeedbackDialog extends ConsumerWidget {
  const QuizFeedbackDialog({super.key, required this.setId});

  final String setId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(feedbackScreenControllerProvider.notifier);

    return AppDialog(
      title: 'Amazing! 🎉',
      noActions: true,
      customContent: Column(
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
                    onTap: () async {
                      await notifier.submitQuizFeedback(
                        level: level,
                        setId: setId,
                        screenSize: MediaQuery.sizeOf(context),
                      );
                      context.router.maybePop(true);
                    },
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
