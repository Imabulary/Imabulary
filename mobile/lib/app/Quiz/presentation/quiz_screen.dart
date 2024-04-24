import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/constants.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = ref.watch(setServiceProvider);
    final flashcards = ref.watch(findAllFlashcardsProvider(
      FindAllFlashcardsDTO(
        pagination: const Pagination(page: 1, limit: 100),
        setId: set?.id,
      ),
    ));
    final results = [];

    final flashcardsAmount = flashcards.value?.result.length ?? 1;
    final randomFlashcardIndex = Random().nextInt(flashcardsAmount);

    return Layout(
      flashcards.when(
        data: (flashcards) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                flashcards.result[randomFlashcardIndex].image_url,
                width: double.infinity,
                height: 256,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TypeSetting(
              flashcards.result[randomFlashcardIndex].word,
              variant: TextVariants.titleLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const TypeSetting('Option #1'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const TypeSetting('Option #2'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const TypeSetting('Option #3'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const TypeSetting('Option #4'),
            ),
          ],
        ),
        error: (error, _) {
          final serverError = error as ServerError;

          return Center(
            child: TypeSetting(
              serverError.message,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
