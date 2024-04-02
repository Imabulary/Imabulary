import 'package:mobile/app/Welcome/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_screen_controller.g.dart';

@riverpod
class WelcomeScreenController extends _$WelcomeScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future loginWithGoogle() async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(authRepository.loginWithGoogle);
  }
}
