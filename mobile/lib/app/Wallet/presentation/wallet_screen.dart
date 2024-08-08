import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mobile/utils/plularize.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(getWalletBalanceProvider);

    return Layout(
      appBar: AppBar(
        title: const TypeSetting(
          'My Wallet',
          variant: TextVariants.headlineLarge,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: wallet.when(
                data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TypeSetting(
                      'Your Current Balance',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TypeSetting(
                      pluralize('Coin', data.balance),
                      variant: TextVariants.titleLarge,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                error: (error, _) => TypeSetting(error is ServerError
                    ? error.message
                    : 'Failed to fetch coins balance. Try again later'),
                loading: () => const TypeSetting('Loading...'),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const TypeSetting(
              'Buy More Coins',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const TypeSetting(
            'With package - cheaper!',
            variant: TextVariants.headlineMedium,
          ),
          const SizedBox(
            height: 32,
          ),
          const TypeSetting(
            'Transaction history',
            variant: TextVariants.headlineMedium,
          ),
        ],
      ),
    );
  }
}
