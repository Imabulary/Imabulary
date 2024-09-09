import 'package:Imabulary/app/Wallet/domain/product/product.dart';
import 'package:Imabulary/utils/either.dart';
import 'package:Imabulary/utils/maybe.dart';
import 'package:Imabulary/utils/request.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_repository.g.dart';

/// This class works with packages and other products like coin that are stored on the Qonversion side
class ProductsRepository {
  ProductsRepository({required this.qonversion});

  final Qonversion qonversion;

  /// Retrieves a list of products either by [offeringId] or all products.
  ///
  /// Returns an [Either] containing either a list of [QProduct] objects or a list of [Product] objects.
  /// The specific type of list returned depends on whether [avoidProductsMapping] param was or wasn't set to `true`
  Future<Either<List<QProduct>, List<Product>>> findAll({
    String? offeringId,
    bool? avoidProductsMapping,
  }) {
    List<QProduct> products;

    return request(() async {
      if (offeringId != null) {
        final offerings = await qonversion.offerings();
        products = Maybe.fromValue(offerings.availableOfferings)
            .map(
              (offerings) => offerings.firstWhere(
                (offering) => offering.id == offeringId,
              ),
            )
            .map((offering) => offering.products)
            .getOrElse([]);
      } else {
        final productsDictionary = await qonversion.products();
        products = productsDictionary.values.toList();
      }

      if (avoidProductsMapping != null && avoidProductsMapping) {
        return Either.fromLeft(products);
      }

      return Either.fromRight(
        products
            .map(
              (product) => Product.fromJson({
                "id": product.qonversionId,
                "price": product.prettyPrice,
              }),
            )
            .toList(),
      );
    });
  }

  Future<Either<QProduct, Product>> findOne(
    String id, {
    bool? avoidProductsMapping,
  }) {
    return request(() async {
      final products = await this.findAll(
        avoidProductsMapping: avoidProductsMapping,
      );

      if (products.isLeft) {
        return Either.fromLeft(
          products.left!.firstWhere((product) => product.qonversionId == id),
        );
      }

      return Either.fromRight(
        products.right!.firstWhere((product) => product.id == id),
      );
    });
  }

  Future<Map<String, QEntitlement>> purchase(String id) {
    return request(() async {
      final product = await this.findOne(id, avoidProductsMapping: true);

      print(product.left);

      return qonversion.purchase(product.left!.toPurchaseModel());
    });
  }
}

@riverpod
ProductsRepository productsRepository(ProductsRepositoryRef ref) =>
    ProductsRepository(qonversion: Qonversion.getSharedInstance());
