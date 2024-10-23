import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/data/feedback_repository.dart';

final findAllFeedbackCategoriesProvider = FutureProvider.autoDispose(
  (ref) => ref.watch(feedbackRepositoryProvider).findAllFeedbackCategories(),
);
