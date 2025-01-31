import 'dart:io';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/app/Feedback/data/dto/feedback_dto.dart';
import 'package:mobile/app/Feedback/domain/feedback.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/request.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
    required String message,
    required Size screenSize,
  }) async {
    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();
    // final connectivity = await Connectivity().checkConnectivity();
    final user = FirebaseAuth.instance.currentUser;

    Map<String, dynamic> deviceData = {};

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceData = {
        'deviceType': 'smartphone',
        'deviceModel': androidInfo.model,
        'osName': 'Android',
        'osVersion': androidInfo.version.release,
      };
    } else if (Platform.isIOS) {
      // final iosInfo = await deviceInfo.iosInfo;
      deviceData = {
        'deviceType': 'smartphone',
        // 'deviceModel': iosInfo.model,
        'osName': 'iOS',
        // 'osVersion': iosInfo.systemVersion,
      };
    }

    final feedbackData = FeedbackDTO(
      message: message,
      deviceType: deviceData['deviceType'],
      deviceModel: deviceData['deviceModel'],
      osName: deviceData['osName'],
      osVersion: deviceData['osVersion'],
      appVersion: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      // networkType: connectivity.toString(),
      networkType: 'wifi',
      screenResolution: '${screenSize.width}x${screenSize.height}',
      userId: user?.uid ?? 'anonymous',
      userEmail: user?.email,
      country: Platform.localeName.split('_').last,
    );

    await Sentry.captureMessage(
      'User Feedback',
      level: SentryLevel.info,
      withScope: (scope) {
        scope.setExtra('feedback', feedbackData.toJson());
      },
    );

    // TODO: Send email
  }
}

@riverpod
FeedbackRepository feedbackRepository(FeedbackRepositoryRef ref) =>
    FeedbackRepository(dio: getDioClient());
