import 'package:mobile/utils/request.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qonversion_repository.g.dart';

enum OfferingTypes {
  subscriptions,
}

class QonversionRepository {
  QonversionRepository({required this.qonversion});

  final Qonversion qonversion;

  Future<List<QProduct>> findAllProducts(OfferingTypes offering) {
    return request(() async {
      final offerings = await qonversion.offerings();

      return offerings.offeringForIdentifier(offering.name)?.products ?? [];
    });
  }

  Future<Map<String, QEntitlement>> purchase(QPurchaseModel product) {
    return request(() async {
      return Qonversion.getSharedInstance().purchase(product);
    });
  }
}

@riverpod
QonversionRepository qonversionRepository(QonversionRepositoryRef ref) =>
    QonversionRepository(qonversion: Qonversion.getSharedInstance());
