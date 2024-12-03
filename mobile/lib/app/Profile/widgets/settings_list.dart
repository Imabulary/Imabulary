import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/data/auth_repository.dart';
import 'package:mobile/app/Profile/widgets/ProfileManageAccount/profile_manage_account.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/type_setting.dart';

class SettingsList extends ConsumerWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signOut = ref.read(authRepositoryProvider).signOut;

    return ListView(
      shrinkWrap: true,
      children: [
        // ListTile(
        //   key: const Key('wallet'),
        //   onTap: () {
        //     AutoRouter.of(context).push(const WalletRoute());
        //   },
        //   title: const TypeSetting('Wallet'),
        // ),
        const ProfileManageAccount(),
        ListTile(
          key: const Key('logout'),
          onTap: signOut,
          title: const TypeSetting('Log out'),
        )
      ],
    );
  }
}
