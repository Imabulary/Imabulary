import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';

// TODO: add tests to test onClick handler and rendering
class SetAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const SetAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = ref.watch(setServiceProvider);

    return AppBar(
      centerTitle: false,
      title: TypeSetting(
        set!.name,
        variant: TextVariants.headlineLarge,
      ),
      actions: [
        Button(onPressed: () { 

         },
         icon: Icons.add,
         label: 'Add card',
         variat: ButtonVariant.textIcon,
         ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
