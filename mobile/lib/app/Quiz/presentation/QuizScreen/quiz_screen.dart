import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Quiz/data/dto/update_quiz_answer_DTO.dart';
import 'package:mobile/app/Quiz/data/quiz_repository.dart';
import 'package:mobile/app/Quiz/domain/result.dart';
import 'package:mobile/app/Quiz/presentation/QuizScreen/quiz_screen_controller.dart';
import 'package:mobile/app/Quiz/presentation/QuizScreen/widgets/quiz_app_bar_widget.dart';
import 'package:mobile/app/Quiz/presentation/QuizScreen/widgets/quiz_options_grid_widget.dart';
import 'package:mobile/app/Set/application/set_provider.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/full_screen_image.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';

@RoutePage()
class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key, this.flashcards});

  final List<FlashCard>? flashcards;

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
        answer: option.word,
        correctAnswer: quizFlashcard.word,
        imageUrl: quizFlashcard.image_url,
      ));
    });

    ref.read(quizRepositoryProvider).updateQuizAnswer(
          UpdateQuizAnswerDTO(cardId: quizFlashcard.id, word: option.word),
        );
  }

  _changeQuestion(List<FlashCard> flashcards) {
    if (_currentFlashcardIndex < flashcards.length - 1) {
      _currentFlashcardIndex++;
    }

    if (_results.length == flashcards.length) {
      final set = ref.read(setServiceProvider);

      ref.invalidate(findSetFlashcardsProvider);

      AutoRouter.of(context).push(
        ResultRoute(
          results: _results,
          flashcards: set?.flashcards ?? [],
          setId: set?.id ?? '',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<FlashCard> flashcardsForQuiz;

    if (widget.flashcards == null || widget.flashcards!.isEmpty) {
      final set = ref.read(setServiceProvider);

      final response = ref.watch(findAllFlashcardsProvider(
        FindAllFlashcardsDTO(
          pagination: const Pagination(),
          setId: set?.id,
        ),
      ));

      if (response.isLoading) {
        return const Layout(Center(child: CircularProgressIndicator()));
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

      flashcardsForQuiz = response.value!.result;
    } else {
      flashcardsForQuiz = widget.flashcards ?? [];
    }

    final currentFlashcard = flashcardsForQuiz[_currentFlashcardIndex];
    final options = QuizScreenController.generateOptions(
      flashcardsForQuiz,
      currentFlashcard,
    );

    return Layout(
      appBar: QuizAppBarWidget(
        onBackPressed: () {
          ref.invalidate(findSetFlashcardsProvider);
          AutoRouter.of(context).maybePop();
        },
        currentFlashcardIndex: _currentFlashcardIndex,
        totalFlashcards: flashcardsForQuiz.length,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FullScreenImage(imageUrl: currentFlashcard.image_url),
          const SizedBox(height: 16),
          TypeSetting(
            currentFlashcard.translated_word,
            variant: TextVariants.titleLarge,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: QuizOptionsGridWidget(
              options: options,
              onTap: (selectedOption) {
                _saveResult(currentFlashcard, selectedOption);
                _changeQuestion(flashcardsForQuiz);
              },
            ),
          ),
        ],
      ),
    );
  }
}
