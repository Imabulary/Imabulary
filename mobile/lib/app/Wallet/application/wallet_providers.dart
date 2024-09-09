import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Wallet/data/wallet/wallet_repository.dart';

final getWalletBalanceProvider = FutureProvider.autoDispose(
  (ref) => ref.watch(walletRepositoryProvider).getBalance(),
);
