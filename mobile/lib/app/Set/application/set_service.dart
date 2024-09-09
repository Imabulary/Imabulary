import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:Imabulary/app/Set/domain/set.dart';

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

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
class SetsPagingController extends _$SetsPagingController {
  @override
  PagingController<int, Set>? build() {
    return null;
  }

  void addController(PagingController<int, Set> controller) {
    state = controller;
  }
}
