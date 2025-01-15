import 'package:mobile/app/Subscription/data/products/products_repository.dart';
import 'package:mobile/app/Subscription/data/qonversion/qonversion_repository.dart';
import 'package:mobile/app/Subscription/domain/subscription/subscription.dart';
import 'package:mobile/app/Subscription/utils/subscription_utils.dart';
import 'package:mobile/utils/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final findAllSubscriptions = FutureProvider.autoDispose((ref) async {
  final qonversionProducts = await ref
      .watch(qonversionRepositoryProvider)
      .findAllProducts(OfferingTypes.subscriptions);

  final products = await ref.watch(productsRepositoryProvider).findAll();

  return products.result.map((product) {
    if (product.externalId == null) {
      return buildSubscription(product);
    }

    try {
      final qProduct = qonversionProducts.firstWhere(
        (qonversionProduct) =>
            qonversionProduct.qonversionId == product.externalId,
      );

      return buildSubscription(product, qProduct: qProduct);
    } on StateError {
      return Either<Subscription, Null>.fromRight(null);
    }
  }).toList();
});
