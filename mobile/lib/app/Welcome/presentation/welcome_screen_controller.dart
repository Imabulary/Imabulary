import 'package:mobile/app/Auth/data/auth_repository.dart';
import 'package:mobile/app/Wallet/data/award/award_repository.dart';
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
    final awardRepository = ref.read(awardRepositoryProvider);

    state = const AsyncLoading();

    try {
      final profile = await authRepository.loginWithGoogle();

      final createUserResponse = await authRepository.createUser(profile);
      print(createUserResponse);

      await awardRepository.setLastAwardedAt(
        createUserResponse.award.lastAwardedAt.toIso8601String(),
      );

      // Set state to success with the user
      state = AsyncValue.data(createUserResponse.user);
    } catch (e, stackTrace) {
      // Handle any errors and set state to error
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
