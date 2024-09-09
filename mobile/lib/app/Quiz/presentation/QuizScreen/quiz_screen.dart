import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Flashcard/application/flashcard_providers.dart';
import 'package:Imabulary/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:Imabulary/app/Flashcard/domain/card.dart';
import 'package:Imabulary/app/Layout/presentation/layout.dart';
import 'package:Imabulary/app/Quiz/domain/result.dart';
import 'package:Imabulary/app/Quiz/presentation/QuizScreen/quiz_screen_controller.dart';
import 'package:Imabulary/app/Quiz/presentation/result_screen.dart';
import 'package:Imabulary/app/Set/application/set_service.dart';
import 'package:Imabulary/atoms/type_setting.dart';
import 'package:Imabulary/components/full_screen_image.dart';
import 'package:Imabulary/shared/models/Pagination/pagination.dart';
import 'package:Imabulary/shared/models/ServerError/server_error.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

// FIXME: move the state and related methods to the data folder of the domain
// Comunicate with it using riverpod
class _QuizScreenState extends ConsumerState<QuizScreen> {
  final List<Result> _results = [];
  int _currentFlashcardIndex = 0;

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

  _changeQuestion(List<FlashCard> flashcards) {
    if (_currentFlashcardIndex < flashcards.length - 1) {
      _currentFlashcardIndex++;
    }

    if (_results.length == flashcards.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            results: _results,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final set = ref.read(setServiceProvider);

    final response = ref.watch(findAllFlashcardsProvider(
      FindAllFlashcardsDTO(
        pagination: const Pagination(page: 1, limit: 100),
        setId: set?.id,
      ),
    ));

    if (response.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (response.hasError) {
      final serverError = response.error as ServerError;

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

    final flashcards = response.value!.result;

    final currentFlashcard = flashcards[_currentFlashcardIndex];
    final options = QuizScreenController.generateOptions(
      flashcards,
      currentFlashcard,
    );

    return Layout(
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FullScreenImage(imageUrl: currentFlashcard.image_url),
            const SizedBox(
              height: 24,
            ),
            TypeSetting(
              currentFlashcard.word,
              variant: TextVariants.titleLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            for (final option in options)
              OutlinedButton(
                onPressed: () {
                  _saveResult(currentFlashcard, option);
                  _changeQuestion(flashcards);
                },
                child: TypeSetting(option.translated_word),
              )
          ],
        ),
      ),
    );
  }
}
