import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result with _$Result {
  const factory Result({
    required String flashcardId,
    required String question,
    required String answer,
    required String correctAnswer,
    required String imageUrl,
  }) = _Result;
}
