import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/app/Wallet/components/balance.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';

class ProfileAppTitle extends ConsumerWidget {
  const ProfileAppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(getWalletBalanceProvider);

    return SizedBox();

    return wallet.when(
      data: (data) => Balance(data.balance),
      error: (error, _) => const Balance(0),
      loading: () => const Balance(0),
    );
  }
}
