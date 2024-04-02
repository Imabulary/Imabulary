import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Profile/widgets/settings_list.dart';
import 'package:mobile/app/Welcome/application/auth_provider.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/maybe.dart';

@RoutePage()
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  _showSettingsBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) => const SettingsList(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    final avatar = Maybe.fromValue(user?.photoURL)
        .map<ImageProvider>((photo) => NetworkImage(photo!))
        .getOrElse(const AssetImage('assets/images/account.png'));

    return Layout(
      const TypeSetting('Welcome to your profile!'),
      currentScreen: CurrentScreens.profile.value,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const AutoLeadingButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                _showSettingsBottomSheet(context, ref);
              },
              child: CircleAvatar(
                backgroundImage: avatar,
              ),
            ),
          )
        ],
      ),
    );
  }
}
