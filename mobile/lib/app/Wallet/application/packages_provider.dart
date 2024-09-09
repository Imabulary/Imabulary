import 'package:Imabulary/app/Wallet/data/packages/packages_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final findAllPackagesProvider = AutoDisposeFutureProvider(
  (ref) => ref.watch(packagesRepositoryProvider).findAll(),
);
