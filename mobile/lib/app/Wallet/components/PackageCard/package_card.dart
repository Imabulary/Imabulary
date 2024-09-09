import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Wallet/application/products_providers.dart';
import 'package:Imabulary/app/Wallet/components/PackageCard/package_card_controller.dart';
import 'package:Imabulary/app/Wallet/domain/package/package.dart';
import 'package:Imabulary/atoms/type_setting.dart';
import 'package:Imabulary/utils/plularize.dart';

class PackageCard extends ConsumerWidget {
  const PackageCard({super.key, required this.package});

  final Package package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(findOneProductProvider(package.externalId));
    final purchaseState = ref.watch(packageCardControllerProvider);
    final purchaseNotifier = ref.read(packageCardControllerProvider.notifier);

    final handlePurchase = purchaseState.isLoading
        ? null
        : () => purchaseNotifier.purchase(package.externalId);

    print(purchaseState.error);

    return GestureDetector(
      onTap: handlePurchase,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TypeSetting(
                package.name,
              ),
              const SizedBox(
                height: 8,
              ),
              product.when(
                data: (data) => TypeSetting(
                  '${pluralize('Coin', package.coinsAmount)} = ${data.right!.price}',
                  variant: TextVariants.headlineMedium,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                error: (error, stackTrace) => TypeSetting(
                  'Failed to load the price',
                ),
                loading: () => TypeSetting('Loading price...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
