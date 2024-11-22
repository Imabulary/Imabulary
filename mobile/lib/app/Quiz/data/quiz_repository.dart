import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/app/Quiz/data/dto/update_quiz_answer_DTO.dart';
import 'package:mobile/app/Quiz/domain/quiz.dart';
import 'package:mobile/shared/models/ServerEnum/server_enum.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repository.g.dart';

class QuizRepository {
  QuizRepository({required this.dio});

  final Dio dio;

  String get endpoint => '${dotenv.env['API_URL']}/quiz';

  Future<QuizStatusesPayload> findAllStatuses() {
    return request(() async {
      final response = await dio.get('$endpoint/statuses');

      final statuses = ServerResponse.extract(response, ServerEnum.fromJson);

      Map<String, dynamic> statusMap = {
        QuizStatuses.not_studied.name: null,
        QuizStatuses.still_learning.name: null,
        QuizStatuses.mastered.name: null,
      };

      for (var status in statuses.result) {
        if (statusMap.containsKey(status.name)) {
          statusMap[status.name] = status;
        }
      }

      return QuizStatusesPayload(
        notStudied: statusMap[QuizStatuses.not_studied.name],
        stillLearning: statusMap[QuizStatuses.still_learning.name],
        mastered: statusMap[QuizStatuses.mastered.name],
      );
    });
  }

  Future<List<ServerEnum>> fetchQuizStatuses() async {
    final response = await dio.get('$endpoint/statuses');

    return ServerResponse.extract(response, ServerEnum.fromJson).result;
  }

  Future<void> updateQuizAnswer(UpdateQuizAnswerDTO quizAnswerDTO) async {
    return request(() async {
      await dio.post('$endpoint/learn', data: quizAnswerDTO.toJson());
    });
  }
}

@riverpod
QuizRepository quizRepository(QuizRepositoryRef ref) =>
    QuizRepository(dio: getDioClient());
