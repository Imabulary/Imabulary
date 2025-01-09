import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/data/auth_repository.dart';
import 'package:mobile/app/Profile/widgets/ProfileManageAccount/profile_manage_account.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';

class SettingsList extends ConsumerWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signOut = ref.read(authRepositoryProvider).signOut;

    // It's more prefferable to use InkWell and Ink instead of ListView and ListTile
    return BottomSheetWrapper(
      padding: const EdgeInsets.all(8),
      children: [
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
