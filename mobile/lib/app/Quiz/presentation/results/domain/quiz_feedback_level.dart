import 'package:mobile/atoms/app_images.dart';

enum QuizFeedbackLevel {
  bad,
  decent,
  loveIt;

  String get name {
    switch (this) {
      case QuizFeedbackLevel.bad:
        return 'Bad';
      case QuizFeedbackLevel.decent:
        return 'Decent';
      case QuizFeedbackLevel.loveIt:
        return 'Love it';
    }
  }

  String get imagePath {
    switch (this) {
      case QuizFeedbackLevel.bad:
        return AppImages.badEmoji;
      case QuizFeedbackLevel.decent:
        return AppImages.decentEmoji;
      case QuizFeedbackLevel.loveIt:
        return AppImages.loveItEmoji;
    }
  }
}
