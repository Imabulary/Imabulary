import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

@freezed
class Feedback with _$Feedback {
  const factory Feedback({
    required String id,
    required String userId,
    required String cardId,
    required bool isAppropriate,
    String? text,
    Map<String, dynamic>? metadata,
  }) = _Feedback;

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
}

@freezed
class FeedbackCategory with _$FeedbackCategory {
  const factory FeedbackCategory({
    required String id,
    required String name,
    required String slug,
    required String meaning,
  }) = _FeedbackCategory;

  factory FeedbackCategory.fromJson(Map<String, dynamic> json) =>
      _$FeedbackCategoryFromJson(json);
}

const kOtherFeedbackCategory = FeedbackCategory(
  id: 'other',
  name: 'Other',
  slug: 'other',
  meaning: '',
);
