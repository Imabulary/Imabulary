import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/domain/card.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Quiz/domain/result.dart';
import 'package:mobile/app/Quiz/presentation/QuizScreen/quiz_screen_controller.dart';
import 'package:mobile/app/Quiz/presentation/result_screen.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  final List<Result> _results = [];

  _saveResult(FlashCard quizFlashcard, FlashCard option) {
    setState(() {
      _results.add(Result(
        flashcardId: quizFlashcard.id,
        question: quizFlashcard.word,
        answer: option.translated_word,
        correctAnswer: quizFlashcard.translated_word,
        imageUrl: quizFlashcard.image_url,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final set = ref.read(setServiceProvider);

    final flashcards = ref.watch(findAllFlashcardsProvider(
      FindAllFlashcardsDTO(
        pagination: const Pagination(page: 1, limit: 100),
        setId: set?.id,
      ),
    ));

    if (flashcards.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (flashcards.hasError) {
      final serverError = flashcards.error as ServerError;

      return Layout(
        Center(
          child: TypeSetting(
            serverError.message,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final options = QuizScreenController.generateOptions(
      flashcards.value!.result,
    );

    return Layout(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              options['correctFlashcard'].image_url,
              width: double.infinity,
              height: 256,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TypeSetting(
            options['correctFlashcard'].word,
            variant: TextVariants.titleLarge,
          ),
          const SizedBox(
            height: 24,
          ),
          for (final option in options['list'])
            OutlinedButton(
              onPressed: () {
                _saveResult(options['correctFlashcard'], option);

                if (_results.length == flashcards.value!.result.length) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        results: _results,
                      ),
                    ),
                  );
                }
              },
              child: TypeSetting(option.translated_word),
            )
        ],
      ),
    );
  }
}
