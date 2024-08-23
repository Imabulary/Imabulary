import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Wallet/application/packages_provider.dart';
import 'package:mobile/atoms/type_setting.dart';

class Packages extends ConsumerWidget {
  const Packages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packages = ref.watch(findAllPackagesProvider);

    print(packages.value);

    return const TypeSetting(
      'With package - cheaper!',
      variant: TextVariants.headlineMedium,
    );
  }
}
