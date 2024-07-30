import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Wallet/data/wallet/wallet_repository.dart';

final getWalletBalanceProvider = FutureProvider.autoDispose(
  (ref) => ref.watch(walletRepositoryProvider).getBalance(),
);
