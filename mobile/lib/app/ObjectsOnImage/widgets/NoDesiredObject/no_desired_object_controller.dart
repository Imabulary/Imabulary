import 'package:mobile/app/Feedback/data/dto/feedback_dto.dart';
import 'package:mobile/app/Feedback/data/feedback_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'no_desired_object_controller.g.dart';

@riverpod
class NoDesiredObjectController extends _$NoDesiredObjectController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> createNoDiseredObjectFeedback(
    CreateNoDiseredObjectDTO createFeedbackDto,
  ) async {
    final feedbackRepository = ref.read(feedbackRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => feedbackRepository.createNoDiseredObjectFeedback(createFeedbackDto),
    );
  }
}
