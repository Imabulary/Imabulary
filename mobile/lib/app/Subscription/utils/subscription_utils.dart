import 'package:mobile/app/Subscription/domain/product/product.dart';
import 'package:mobile/app/Subscription/domain/subscription/subscription.dart';
import 'package:mobile/utils/either.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

Either<Subscription, Null> buildSubscription(
  Product product, {
  QProduct? qProduct,
}) {
  final freePrice = '\$0';

  final subscription = {
    "id": product.id,
    "storeId": product.externalId,
    "name": product.name,
    "description": product.description,
    "benefits": product.benefits.toJson(),
  };

  if (qProduct == null) {
    subscription.addEntries({"price": freePrice}.entries);

    return Either<Subscription, Null>.fromLeft(
      Subscription.fromJson(subscription),
    );
  }

  final price = qProduct.prettyPrice != null && qProduct.prettyPrice!.isNotEmpty
      ? qProduct.prettyPrice!
      : freePrice;

  subscription.addEntries({"price": price}.entries);

  return Either<Subscription, Null>.fromLeft(
    Subscription.fromJson(subscription),
  );
}
