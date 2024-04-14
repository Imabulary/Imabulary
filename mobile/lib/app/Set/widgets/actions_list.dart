import 'package:flutter/material.dart';
import 'package:mobile/app/Set/components/delete_action_item.dart';
import 'package:mobile/app/Set/components/edit_action_item.dart';

class ActionsList extends StatelessWidget {
  const ActionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [EditActionItem(), DeleteActionItem()],
    );
  }
}
