import 'package:mobile/app/Wallet/data/packages/packages_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final findAllPackagesProvider = FutureProvider.autoDispose(
  (ref) => ref.watch(packagesRepositoryProvider).findAll(),
);
