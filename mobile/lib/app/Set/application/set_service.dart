import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile/app/Set/domain/set.dart';

part 'set_service.g.dart';

/// State might be `null` if user is not on the set page
@Riverpod(keepAlive: true)
class SetService extends _$SetService {
  @override
  Set? build() {
    return null;
  }

  void openSet(Set set) {
    state = set;
  }
}
