import 'package:flutter/material.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app/Home/widgets/CardMenu/card_menu.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizCard extends StatelessWidget {
  final SetRepository setsRepository;

  const QuizCard({super.key, required this.setsRepository});

  Widget buildSetSection(String title, List<Set> sets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TypeSetting(
          '$title (${sets.length})',
          variant: TextVariants.headlineMedium,
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 7,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sets.length,
          itemBuilder: (context, index) {
            final set = sets[index];

            final firstFlashcard =
                set.flashcards != null && set.flashcards!.isNotEmpty
                    ? set.flashcards!.first
                    : null;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  firstFlashcard != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            firstFlashcard.image_url,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.image_not_supported,
                          size: 50,
                        ),
                  const SizedBox(width: 15),
                  Text(set.name)
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  void showQuizModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder(
          future: setsRepository.findAll(const Pagination(page: 1)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error loading sets"),
              );
            } else if (snapshot.hasData) {
              final serverResponse = snapshot.data;
              final sets = serverResponse!.result;

              final inProgressSets = sets.where((set) {
                return (set.flashcards?.any((flashcard) =>
                        flashcard.QuizStatus.name != 'not_studied') ??
                    false);
              }).toList();

              final newQuizSets = sets.where((set) {
                return (set.flashcards?.every((flashcard) =>
                        flashcard.QuizStatus.name == 'not_studied') ??
                    false);
              }).toList();

              return Container(
                height: MediaQuery.of(context).size.height * 0.9,
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TypeSetting(
                      'Select a set',
                      variant: TextVariants.headlineLarge,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    const TypeSetting(
                      'Please select the set for a quiz.',
                      style: TextStyle(
                        color: Color.fromRGBO(190, 190, 190, 1),
                      ),
                      variant: TextVariants.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    buildSetSection('In progress', inProgressSets),
                    buildSetSection('New quiz', newQuizSets),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Future<bool> canTakeQuiz() async {
    final setsResponse =
        await setsRepository.findAll(const Pagination(page: 1));
    final sets = setsResponse.result;
    return sets.any((set) => set.flashcards!.length >= 2);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: canTakeQuiz(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CardMenu(
            backgroundColor: AppColors.success,
            component: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: SvgPicture.asset(
                    'assets/images/quiz-white.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const TypeSetting(
                  "Take a quiz",
                  variant: TextVariants.headlineMedium,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error loading sets"),
          );
        } else if (snapshot.hasData) {
          bool isQuizAvailable = snapshot.data!;
          return Stack(
            children: [
              CardMenu(
                backgroundColor: AppColors.success,
                onTap: isQuizAvailable
                    ? () {
                        showQuizModal(context);
                      }
                    : null,
                component: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: SvgPicture.asset(
                        'assets/images/quiz-white.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Take a quiz",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          if (!isQuizAvailable)
                            const Text(
                              "You have to create at least 1 set with minimum 2 flashcards to start a quiz",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                              textAlign: TextAlign.start,
                              softWrap: true,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isQuizAvailable)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
