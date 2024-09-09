import 'package:Imabulary/app/Wallet/data/products/products_repository.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_card_controller.g.dart';

@riverpod
class PackageCardController extends _$PackageCardController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> purchase(String id) async {
    final productsRepository = ref.read(productsRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard<Map<String, QEntitlement>>(() async {
      return productsRepository.purchase(id);
    });
  }
}
