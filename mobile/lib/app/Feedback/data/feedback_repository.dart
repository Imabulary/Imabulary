import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/app/Feedback/data/dto/feedback_dto.dart';
import 'package:mobile/app/Feedback/domain/feedback.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'feedback_repository.g.dart';

class FeedbackRepository {
  FeedbackRepository({required this.dio});

  final Dio dio;

  String get endpoint => '${dotenv.env['API_URL']}/feedback';

  Future<ServerResponse<List<FeedbackCategory>>> findAllFeedbackCategories() {
    return request(() async {
      final response = await dio.get('$endpoint/categories');

      return ServerResponse.extract(response, FeedbackCategory.fromJson);
    });
  }

  Future<bool> createNoDiseredObjectFeedback(
    CreateNoDiseredObjectDTO createFeedbackDto,
  ) {
    return request(() async {
      final response = await dio.post(
        '$endpoint/create/no-desired-object',
        data: createFeedbackDto.toJson(),
      );

      return response.data['result'];
    });
  }

  Future<bool> like(LikeFlashcardDTO likeFlashcardDTO) {
    return request(() async {
      final response = await dio.post(
        '$endpoint/create',
        data: likeFlashcardDTO.toJson(),
      );

      return response.data['result'];
    });
  }

  Future<void> submitFeedback({
    required String title,
    required FeedbackDTO feedbackData,
  }) async {
    await Sentry.captureMessage(
      title,
      level: SentryLevel.info,
      withScope: (scope) {
        scope.setContexts('feedback', feedbackData.toJson());
      },
    );
  }
}

@riverpod
FeedbackRepository feedbackRepository(FeedbackRepositoryRef ref) =>
    FeedbackRepository(dio: getDioClient());
