import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile/app/Auth/application/auth_provider.dart';
import 'package:mobile/app/Feedback/application/feedback_service.dart';
import 'package:mobile/app/Feedback/data/dto/feedback_dto.dart';
import 'package:mobile/app/Feedback/data/feedback_repository.dart';
import 'package:mobile/app/Feedback/data/technical_data_repository.dart';
import 'package:mobile/app/Feedback/domain/feedback.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:mobile/app/Quiz/presentation/results/domain/quiz_feedback_level.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_screen_controller.g.dart';

@riverpod
class FeedbackScreenController extends _$FeedbackScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future Function() dislike(GlobalKey<FormBuilderState> formKey) => () async {
        final flashcardRepository = ref.read(flashCardRepositoryProvider);
        final selectedCategories = ref.watch(feedbackServiceProvider);
        final feedbackServiceNotifier = ref.watch(
          feedbackServiceProvider.notifier,
        );
        final flashcard = ref.watch(flashcardServiceProvider);

        if (flashcard == null) {
          return;
        }

        final formState = formKey.currentState;

        final categories = selectedCategories
            .map((category) => category.id)
            .where(
              (id) => id != kOtherFeedbackCategory.id,
            ) // NOTE: This filters out only `other` feedback category, whoose ID is not valid UUID. Add filtering rule based on UUID RegExp to filter out all incorrect values if it's required in the future
            .toList();

        final String? text = formState?.fields['text']?.value;

        state = const AsyncLoading();
        state = await AsyncValue.guard(
          () => flashcardRepository.dislike(
            DislikeFlashcardDTO(
              id: flashcard.id,
              categories: categories,
              text: text,
            ),
          ),
        );

        feedbackServiceNotifier.clear();
      };

  Future Function() likeFlashcard(String flashcardId) => () async {
        final feedbackRepository = ref.watch(feedbackRepositoryProvider);

        state = const AsyncLoading();
        state = await AsyncValue.guard(
          () => feedbackRepository.like(
            LikeFlashcardDTO(cardId: flashcardId, isAppropriate: true),
          ),
        );
      };

  Future Function() submitGeneralFeedback({
    required String title,
    required String message,
    required Size screenSize,
  }) =>
      () async {
        try {
          final feedbackRepository = ref.watch(feedbackRepositoryProvider);
          final user = ref.read(authStateProvider).value;

          state = const AsyncLoading();
          state = await AsyncValue.guard(
            () async {
              final technicalData =
                  await TechnicalDataRepository.getRepository()
                      .getTechnicalData(screenSize);

              final feedbackData = FeedbackDTO(
                message: message,
                deviceType: technicalData.deviceType,
                deviceModel: technicalData.deviceModel,
                osName: technicalData.osName,
                osVersion: technicalData.osVersion,
                appVersion: technicalData.appVersion,
                buildNumber: technicalData.appBuildNumber,
                networkType: technicalData.networkType,
                screenResolution: technicalData.screenResolution,
                userId: user?.uid ?? 'anonymous',
                userEmail: user?.email,
                country: Platform.localeName.split('_').last,
              );

              feedbackRepository.submitFeedback(
                title: 'General Feedback',
                feedbackData: feedbackData,
              );
            },
          );
        } catch (error) {
          state = AsyncError(error, StackTrace.current);
        }
      };

  Future Function() submitQuizFeedback({
    required QuizFeedbackLevel level,
    required String setId,
    required Size screenSize,
  }) =>
      () async {
        final feedbackRepository = ref.watch(feedbackRepositoryProvider);
        final user = ref.read(authStateProvider).value;
        final technicalDataRepository = TechnicalDataRepository.getRepository();

        state = const AsyncLoading();
        state = await AsyncValue.guard(
          () async {
            final technicalData =
                await technicalDataRepository.getTechnicalData(screenSize);

            final feedbackData = FeedbackDTO(
              message: 'Quiz feedback',
              deviceType: technicalData.deviceType,
              deviceModel: technicalData.deviceModel,
              osName: technicalData.osName,
              osVersion: technicalData.osVersion,
              appVersion: technicalData.appVersion,
              buildNumber: technicalData.appBuildNumber,
              networkType: technicalData.networkType,
              screenResolution: technicalData.screenResolution,
              userId: user?.uid ?? 'anonymous',
              userEmail: user?.email,
              country: Platform.localeName.split('_').last,
              additionalData: {
                'level': level.value,
                'setId': setId,
              },
            );

            feedbackRepository.submitFeedback(
              title: 'First quiz feedback',
              feedbackData: feedbackData,
              isQuizFeedback: true,
            );
          },
        );
      };
}
