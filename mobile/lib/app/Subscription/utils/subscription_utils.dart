import 'package:mobile/app/Subscription/domain/product/product.dart';
import 'package:mobile/app/Subscription/domain/subscription/subscription.dart';
import 'package:mobile/app/Subscription/utils/constants.dart';
import 'package:mobile/utils/either.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

Either<Subscription, Null> buildSubscription(
  Product product, {
  QProduct? qProduct,
}) {
  final freePrice = '\$0';

  final icons = {
    kFreeSubscriptionId: "school_outlined",
    kNextSubscriptionId: "rocket_launch_outlined"
  };

  final subscription = {
    "id": product.id,
    "storeId": product.externalId,
    "name": product.name,
    "description": product.description,
    "benefits": product.benefits.toJson(),
    "icon": icons[product.internalId] ?? 'school_outlined'
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

String getSubscriptionSubtitle(String price) {
  return '${price} / month';
}
