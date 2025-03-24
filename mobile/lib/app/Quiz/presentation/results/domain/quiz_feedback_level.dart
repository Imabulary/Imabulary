enum QuizFeedbackLevel {
  bad(1),
  decent(2),
  loveIt(3);

  const QuizFeedbackLevel(this.value);

  final int value;

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

  String get emoji {
    switch (this) {
      case QuizFeedbackLevel.bad:
        return '😞';
      case QuizFeedbackLevel.decent:
        return '🙂';
      case QuizFeedbackLevel.loveIt:
        return '😍';
    }
  }
}
