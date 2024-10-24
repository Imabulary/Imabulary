import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/application/feedback_service.dart';
import 'package:mobile/app/Feedback/data/feedback_repository.dart';

final findAllFeedbackCategoriesProvider = FutureProvider.autoDispose(
  (ref) => ref.watch(feedbackRepositoryProvider).findAllFeedbackCategories(),
);

final isCategorySelectedProvider = Provider.family((ref, String categoryId) {
  final selectedCategories = ref.watch(feedbackServiceProvider);

  return selectedCategories.any(
    (category) => category.id == categoryId,
  );
});

final isSelectedCategoriesEmptyProvider = Provider((ref) {
  final selectedCategories = ref.watch(feedbackServiceProvider);

  return selectedCategories.isEmpty;
});
