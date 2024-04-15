import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_action_item_controller.g.dart';

@riverpod
class DeleteActionItemController extends _$DeleteActionItemController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future delete(String id) async {
    final setRepository = ref.read(setRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => setRepository.delete(id));
  }
}
