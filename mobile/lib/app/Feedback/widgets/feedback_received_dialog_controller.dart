import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/application/flashcard_mixin.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_received_dialog_controller.g.dart';

@riverpod
class FeedbackReceivedDialogController
    extends _$FeedbackReceivedDialogController with FlashcardMixin {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future Function() regenerate(BuildContext context) => () async {
        final flashcardRepository = ref.read(flashCardRepositoryProvider);
        final flashcard = ref.watch(flashcardServiceProvider);

        if (flashcard == null) return;

        state = const AsyncLoading();
        state = await AsyncValue.guard(() async {
          final imageProcessingResult = await flashcardRepository.regenerate(
            flashcard.id,
          );

          await redirectAfterImageProcessing(
            imageProcessingResult,
            ref,
            context,
          );
        });
      };
}
