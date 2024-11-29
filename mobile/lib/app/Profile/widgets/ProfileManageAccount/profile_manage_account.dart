import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Profile/widgets/ProfileManageAccount/profile_manage_account_controller.dart';
import 'package:mobile/atoms/type_setting.dart';

class ProfileManageAccount extends ConsumerWidget {
  const ProfileManageAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      key: const Key('delete'),
      onTap: ProfileManageAccountController.showSetsBottomSheet(context),
      title: const TypeSetting('Manage your account'),
    );
  }
}
