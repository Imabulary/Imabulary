import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Quiz/domain/quiz.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/app/Set/widgets/flashcards_group_widget.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/app/Set/domain/set.dart';

@RoutePage()
class SetScreen extends ConsumerStatefulWidget {
  const SetScreen({super.key});

  @override
  ConsumerState<SetScreen> createState() => _SetScreenState();
}

class _SetScreenState extends ConsumerState<SetScreen> {
  Set? set;
  List<FlashCard> flashcards = [];

  List<FlashCard> get studiedFlashcards => flashcards.where((element) {
        return element.quizStatus?.name == QuizStatuses.mastered.name;
      }).toList();
  List<FlashCard> get notStudiedFlashcards => flashcards.where((element) {
        return element.quizStatus?.name == QuizStatuses.not_studied.name;
      }).toList();
  List<FlashCard> get learningFlashcards => flashcards.where((element) {
        return element.quizStatus?.name == QuizStatuses.still_learning.name;
      }).toList();

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      set = ref.read(setServiceProvider);
    });
    final result = await ref.watch(findAllFlashcardsProvider(
      FindAllFlashcardsDTO(pagination: const Pagination(), setId: set?.id),
    ).future);
    flashcards.clear();
    flashcards = result.result;
  }

  List<FlashCard> makeFlashcards(QuizStatuses quizStatus) {
    return flashcards.where(
      (element) {
        return element.quizStatus?.name == quizStatus.name;
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      SingleChildScrollView(
        child: Column(
          children: [
            Button(
              onPressed: () => SetAppBarController.startQuiz(
                context,
                set?.flashcards,
              ).then(
                (_) async => fetchData(),
              ),
              label: 'Start quiz',
              variat: ButtonVariant.elevatedExpanded,
            ),
            const SizedBox(height: 12),
            if (flashcards.isNotEmpty)
              Column(
                children: [
                  if (notStudiedFlashcards.isNotEmpty)
                    FlashcardsGroupWidget(
                      flashCards: notStudiedFlashcards,
                      title: 'Not studied (${notStudiedFlashcards.length})',
                    ),
                  if (learningFlashcards.isNotEmpty)
                    FlashcardsGroupWidget(
                      flashCards: learningFlashcards,
                      title: 'Still learning (${learningFlashcards.length})',
                    ),
                  if (studiedFlashcards.isNotEmpty)
                    FlashcardsGroupWidget(
                      flashCards: studiedFlashcards,
                      title: 'Mastered (${studiedFlashcards.length})',
                    ),
                ],
              ),
            if (flashcards.isEmpty)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
      appBar: const SetAppBar(),
    );
  }
}
