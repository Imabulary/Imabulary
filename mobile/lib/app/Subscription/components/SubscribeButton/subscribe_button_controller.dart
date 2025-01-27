import 'package:mobile/app/Profile/data/dto/profile_dto.dart';
import 'package:mobile/app/Profile/data/user_repository.dart';
import 'package:mobile/app/Profile/domain/profile.dart';
import 'package:mobile/app/Subscription/data/qonversion/qonversion_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscribe_button_controller.g.dart';

@riverpod
class SubscribeButtonController extends _$SubscribeButtonController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future subscribe(String productId, String? qonversionId) async {
    final id = qonversionId ?? '';
    final qonversionRepository = ref.watch(qonversionRepositoryProvider);
    final userRepository = ref.read(userRepositoryProvider);

    final products = await qonversionRepository.findAllProducts(
      OfferingTypes.subscriptions,
    );

    state = const AsyncLoading();
    state = await AsyncValue.guard<Profile>(() async {
      final product = products.firstWhere(
        (product) => product.qonversionId == id,
      );

      final result = await qonversionRepository.purchase(product);

      print(result);

      return userRepository.update(UpdateUserDTO(productId: productId));
    });
  }
}
