import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/components/FlashcardQuickAction/flashcard_quick_action.dart';
import 'package:mobile/app/Home/components/QuizQuickAction/quiz_quick_action.dart';
import 'package:mobile/app/Home/components/SetQuickAction/set_quick_action.dart';
import 'package:mobile/atoms/type_setting.dart';

class QuickActions extends ConsumerWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
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
        FlashcardQuickAction(),
        SizedBox(
          height: 12,
        ),
        SetQuickAction(),
        SizedBox(
          height: 12,
        ),
        QuizQuickAction()
      ],
    );
  }
}
