import 'package:mobile/app/Subscription/data/qonversion/qonversion_repository.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscribe_button_controller.g.dart';

@riverpod
class SubscribeButtonController extends _$SubscribeButtonController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future subscribe(String? productId) async {
    final id = productId ?? '';
    final qonversionRepository = ref.watch(qonversionRepositoryProvider);

    final products = await qonversionRepository.findAllProducts(
      OfferingTypes.subscriptions,
    );

    state = const AsyncLoading();
    state = await AsyncValue.guard<Map<String, QEntitlement>>(() async {
      final product = products.firstWhere((product) => product.storeId == id);
      final productPurchasModel = product.toPurchaseModel();

      return qonversionRepository.purchase(productPurchasModel);
    });
  }
}
