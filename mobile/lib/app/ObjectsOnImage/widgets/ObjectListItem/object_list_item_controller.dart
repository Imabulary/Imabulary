import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'object_list_item_controller.g.dart';

@riverpod
class ObjectListItemController extends _$ObjectListItemController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future create(CreateFlashcardDTO createFlashcardDto) async {}
}
