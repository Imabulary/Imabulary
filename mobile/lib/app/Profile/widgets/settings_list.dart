import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Auth/data/auth_repository.dart';
import 'package:Imabulary/app/Wallet/presentation/wallet_screen.dart';
import 'package:Imabulary/atoms/type_setting.dart';

class SettingsList extends ConsumerWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signOut = ref.read(authRepositoryProvider).signOut;

    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          key: const Key('wallet'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WalletScreen(),
              ),
            );
          },
          title: const TypeSetting('Wallet'),
        ),
        ListTile(
          key: const Key('logout'),
          onTap: signOut,
          title: const TypeSetting('Log out'),
        )
      ],
    );
  }
}
