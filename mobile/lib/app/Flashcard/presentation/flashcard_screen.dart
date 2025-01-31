import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen_controller.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/components/voiceover_button.dart';
import 'package:mobile/app/Flashcard/widgets/FlashcardAppBar/flashcard_app_bar.dart';
import 'package:mobile/app/Flashcard/widgets/SecondNegativeFeedbackDialog/second_negative_feedback_dialog.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/app_images.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/full_screen_image.dart';
import 'package:mobile/utils/fp.dart';

@RoutePage()
class FlashcardScreen extends ConsumerWidget {
  const FlashcardScreen({super.key});

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

    AutoRouter.of(context).push(const FeedbackRoute());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcard = ref.watch(flashcardServiceProvider);
    final state = ref.watch(feedbackScreenControllerProvider);
    final notifier = ref.watch(feedbackScreenControllerProvider.notifier);

    final isLoading = state.isLoading;
    final isError = state.hasError;

    final onLike = isLoading && !isError
        ? null
        : notifier.likeFlashcard(flashcard?.id ?? '');

    return Scaffold(
      appBar: const FlashcardAppBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FullScreenImage(imageUrl: flashcard!.image_url),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    TypeSetting(flashcard.word,
                        variant: TextVariants.titleLarge),
                    if (flashcard.audio_url != null)
                      VoiceoverButton(audioUrl: flashcard.audio_url!),
                  ],
                ),
                TypeSetting(
                  flashcard.translated_word,
                  variant: TextVariants.headlineLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                if (flashcard.speech_part != null)
                  TypeSetting(
                    capitalize(flashcard.speech_part!),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                if (flashcard.explanation != null &&
                    flashcard.translated_explanation != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const TypeSetting(
                        'Explanation',
                        style: TextStyle(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TypeSetting(flashcard.explanation!),
                      const TypeSetting(
                        'English',
                        variant: TextVariants.bodySmall,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TypeSetting(flashcard.translated_explanation!),
                      const TypeSetting(
                        'Ukrainian',
                        variant: TextVariants.bodySmall,
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 16,
                ),
                const TypeSetting(
                  'Related phrases',
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TypeSetting(flashcard.phrase),
                const TypeSetting(
                  'English',
                  variant: TextVariants.bodySmall,
                ),
                const SizedBox(
                  height: 12,
                ),
                TypeSetting(flashcard.translated_phrase),
                const TypeSetting(
                  'Ukrainian',
                  variant: TextVariants.bodySmall,
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onLike,
              icon: SvgPicture.asset(
                AppImages.like,
                height: 24,
                width: 24,
              ),
            ),
            Container(
              width: 48,
              height: 1,
              color: AppColors.black.withOpacity(0.1),
            ),
            IconButton(
              onPressed: () =>
                  _handleDislike(context, flashcard.is_regenerated),
              icon: SvgPicture.asset(
                AppImages.dislike,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
