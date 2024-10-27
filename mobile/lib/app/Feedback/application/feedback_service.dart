import 'package:mobile/app/Feedback/domain/FeedbackCategory/feedback_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_service.g.dart';

@Riverpod(keepAlive: true)
class FeedbackService extends _$FeedbackService {
  @override
  Set<FeedbackCategory> build() {
    return {};
  }

  void onCategorySelect(FeedbackCategory newCategory) {
    final isCategorySelected = state.any(
      (category) => category.id == newCategory.id,
    );

    if (isCategorySelected) {
      state = state.where((category) => category.id != newCategory.id).toSet();
    } else {
      state = {...state, newCategory};
    }
  }

  clear() {
    state = {};
  }
}
