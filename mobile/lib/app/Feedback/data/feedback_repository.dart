import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/data/dto/feedback_dto.dart';
import 'package:mobile/app/Feedback/domain/feedback.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
}

@riverpod
FeedbackRepository feedbackRepository(Ref ref) =>
    FeedbackRepository(dio: getDioClient());
