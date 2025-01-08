import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Home/components/FlashcardQuickAction/flashcard_quick_action.dart';
import 'package:mobile/app/Home/components/QuizQuickAction/quiz_quick_action.dart';
import 'package:mobile/app/Home/components/SetQuickAction/set_quick_action.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/app/Set/domain/set.dart';

class QuickActions extends ConsumerWidget {
  const QuickActions({super.key, required this.sets, required this.flashcards});

  final AsyncValue<ServerResponse<List<Set>>> sets;
  final AsyncValue<ServerResponse<List<FlashCard>>> flashcards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TypeSetting(
          "Quick actions",
          variant: TextVariants.headlineMedium,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        FlashcardQuickAction(
          flashcards: flashcards,
        ),
        SizedBox(
          height: 12,
        ),
        SetQuickAction(sets: sets),
        SizedBox(
          height: 12,
        ),
        QuizQuickAction(
          sets: sets,
        )
      ],
    );
  }
}
