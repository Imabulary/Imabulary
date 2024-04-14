import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/atoms/type_setting.dart';

class EditActionItem extends ConsumerWidget {
  const EditActionItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ListTile(
      leading: Icon(Icons.edit),
      title: TypeSetting('Edit'),
    );
  }
}
