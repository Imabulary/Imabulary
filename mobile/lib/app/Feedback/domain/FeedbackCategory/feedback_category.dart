import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_category.freezed.dart';
part 'feedback_category.g.dart';

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
