import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/app/Subscription/domain/product/product.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_repository.g.dart';

class ProductsRepository {
  ProductsRepository({required this.dio});

  final Dio dio;

  String get endpoint => '${dotenv.env['API_URL']}/products';

  Future<ServerResponse<List<Product>>> findAll() {
    return request(() async {
      final response = await dio.get(endpoint);

      return ServerResponse.extract(response, Product.fromJson);
    });
  }
}

@riverpod
ProductsRepository productsRepository(ProductsRepositoryRef ref) =>
    ProductsRepository(dio: getDioClient());
