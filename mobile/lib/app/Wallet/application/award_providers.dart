import 'package:Imabulary/app/Wallet/data/award/award_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getLastAwardedAtProvider = FutureProvider.autoDispose(
  (ref) => ref.watch(awardRepositoryProvider).getLastAwardedAt(),
);
