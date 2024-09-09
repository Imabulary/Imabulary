import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Profile/widgets/SetsGrid/sets_grid_controller.dart';
import 'package:Imabulary/app/Set/application/set_service.dart';
import 'package:Imabulary/atoms/type_setting.dart';

// TODO: add tests to verify whether the item is rendered correctly and it opens the bottom sheet modal
class EditActionItem extends ConsumerWidget {
  const EditActionItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = ref.watch(setServiceProvider);

    return ListTile(
      onTap: () {
        Navigator.pop(context);
        SetsGridController.showSetFormBottomSheet(context)(set: set);
      },
      leading: const Icon(Icons.edit),
      title: const TypeSetting('Edit'),
    );
  }
}
