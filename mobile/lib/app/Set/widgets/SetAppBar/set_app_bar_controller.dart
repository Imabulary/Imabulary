import 'package:flutter/material.dart';
import 'package:mobile/app/Set/widgets/actions_list.dart';

class SetAppBarController {
  static void Function() showActionsBottomSheet(BuildContext context) => () {
        showModalBottomSheet(
          isScrollControlled: true,
          clipBehavior: Clip.hardEdge,
          context: context,
          builder: (context) => const ActionsList(),
        );
      };
}
