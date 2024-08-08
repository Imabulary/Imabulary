import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/widgets/FlashcardAppBar/flashcard_app_bar.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/full_screen_image.dart';

@RoutePage()
class FlashcardScreen extends ConsumerWidget {
  const FlashcardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcard = ref.watch(flashcardServiceProvider);

    return Layout(
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FullScreenImage(imageUrl: flashcard!.image_url),
            const SizedBox(
              height: 24,
            ),
            TypeSetting(flashcard.word, variant: TextVariants.titleLarge),
            TypeSetting(
              flashcard.translated_word,
              variant: TextVariants.headlineLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            if (flashcard.speech_part != null)
              TypeSetting(
                flashcard.speech_part!,
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
      appBar: const FlashcardAppBar(),
    );
  }
}
