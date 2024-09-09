import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:Imabulary/app/Wallet/application/packages_provider.dart';
import 'package:Imabulary/app/Wallet/components/PackageCard/package_card.dart';
import 'package:Imabulary/atoms/colors.dart';
import 'package:Imabulary/atoms/type_setting.dart';

class Packages extends ConsumerWidget {
  const Packages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packages = ref.watch(findAllPackagesProvider);

    return packages.when(
      data: (packages) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TypeSetting(
              'Purchase more coins',
              variant: TextVariants.headlineMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            AlignedGridView.count(
              itemCount: packages.totalItems,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => PackageCard(
                package: packages.result[index],
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => Column(
        children: [
          TypeSetting(
            "Oh no! We're very sorry, but we couldn't load any packages",
          ),
          const SizedBox(
            height: 8,
          ),
          OutlinedButton.icon(
            icon: Icon(Icons.replay),
            onPressed: () {
              ref.invalidate(findAllPackagesProvider);
            },
            label: const TypeSetting(
              'Try Again',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
      loading: () => Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
