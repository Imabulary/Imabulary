import 'package:mobile/app/Auth/data/auth_repository.dart';
import 'package:mobile/app/Auth/domain/auth.dart';
import 'package:mobile/utils/analytics_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'welcome_screen_controller.g.dart';

@riverpod
class WelcomeScreenController extends _$WelcomeScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future login(AppAuthProvider provider) async {
    final authRepository = ref.read(authRepositoryProvider);

    analyticsEngine.trackLoginEvent(provider.name);

    final providers = {
      AppAuthProvider.apple.name: authRepository.loginWithApple,
      AppAuthProvider.google.name: authRepository.loginWithGoogle,
      AppAuthProvider.anonymus.name: authRepository.loginAnonymously,
    };

    if (providers[provider.name] == null) {
      return;
    }

    state = const AsyncLoading();
    state = await AsyncValue.guard(providers[provider.name]!);
  }
}
