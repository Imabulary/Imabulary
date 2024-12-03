import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qonversion_repository.g.dart';

enum OfferingTypes {
  imabularyNext('imabulary_next'),
  packages('packages');

  final String id;

  const OfferingTypes(this.id);
}

class QonversionRepository {
  Future<List<QProduct>?> imabularyNextSubscriptions() async {
    final offerings = await Qonversion.getSharedInstance().offerings();
    return offerings.offeringForIdentifier(OfferingTypes.imabularyNext.id)?.products;
  }

  Future<List<QProduct>?> packages() async {
    final offerings = await Qonversion.getSharedInstance().offerings();
    return offerings.offeringForIdentifier(OfferingTypes.packages.id)?.products;
  }

  Future<Map<String, QEntitlement>> makePurchase(QPurchaseModel product) async {
    return await Qonversion.getSharedInstance().purchase(product);
  }
}

@riverpod
QonversionRepository qonversionRepository(QonversionRepositoryRef ref) => QonversionRepository();
