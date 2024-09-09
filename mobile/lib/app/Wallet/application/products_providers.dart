import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Wallet/data/products/products_repository.dart';

final findOneProductProvider = FutureProvider.autoDispose.family(
  (ref, String id) => ref.watch(productsRepositoryProvider).findOne(id),
);
