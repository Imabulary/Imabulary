import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';

class ProfileAppTitle extends ConsumerWidget {
  const ProfileAppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(getWalletBalanceProvider);

    return wallet.when(
      data: (data) => Row(
        children: [
          TypeSetting('Coins: ${data.balance}'),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const TypeSetting(
              'More Coins',
              style: TextStyle(color: AppColors.primary),
            ),
          )
        ],
      ),
      error: (error, _) => Container(
        alignment: Alignment.centerLeft,
        child: TypeSetting(error is ServerError
            ? error.message
            : 'Failed to fetch coins balance. Try again later'),
      ),
      loading: () => const TypeSetting('Loading...'),
    );
  }
}
