import 'package:Imabulary/app/Wallet/data/wallet/wallet_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collect_daily_award_button_controller.g.dart';

// NOTE if you ever need to call collectAward method somewhere else, move collect method from this controller to wallet_screen_controller.dart
@riverpod
class CollectDailyAwardButtonController
    extends _$CollectDailyAwardButtonController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future collect() async {
    final walletRepository = ref.read(walletRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => walletRepository.collectAward());
  }
}
