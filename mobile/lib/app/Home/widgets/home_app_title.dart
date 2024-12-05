import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Home/components/welcome_title.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';

class HomeAppTitle extends ConsumerWidget {
  const HomeAppTitle({
    super.key,
    required this.flashcards,
  });

  final AsyncValue<ServerResponse<List<FlashCard>>> flashcards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeTitle =
        flashcards.hasValue && flashcards.value!.result.isNotEmpty
            ? const WelcomeTitle(customTitle: "Welcome back 👋")
            : const WelcomeTitle();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        welcomeTitle,
      ],
    );
  }
}
