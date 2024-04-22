import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/FlashCard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/widgets/FlashcardAppBar/flashcard_app_bar.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

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
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                flashcard!.image_url,
                width: double.infinity,
                height: 256,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TypeSetting(flashcard.word, variant: TextVariants.titleLarge),
            const SizedBox(
              height: 16,
            ),
            TypeSetting(
              'Related phrases',
              style: TextStyle(
                color: colors['primary'],
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
