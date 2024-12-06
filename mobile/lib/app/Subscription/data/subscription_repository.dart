import 'package:mobile/utils/request.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscription_repository.g.dart';

enum OfferingTypes {
  imabulary_next,
}

class SubscriptionRepository {
  SubscriptionRepository({required this.qonversion});

  final Qonversion qonversion;

  Future<List<QProduct>?> findOne(OfferingTypes offering) {
    return request(() async {
      final offerings = await qonversion.offerings();

      return offerings.offeringForIdentifier(offering.name)?.products;
    });
  }

  Future<Map<String, QEntitlement>> purchase(QPurchaseModel product) {
    return request(() async {
      return Qonversion.getSharedInstance().purchase(product);
    });
  }
}

@riverpod
SubscriptionRepository subscriptionRepository(SubscriptionRepositoryRef ref) =>
    SubscriptionRepository(qonversion: Qonversion.getSharedInstance());
