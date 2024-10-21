import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/widgets/set_form.dart';
import 'package:mobile/app/Set/domain/set.dart';

class SetsGridController {
  static void Function({Set? set}) showSetFormBottomSheet(
    BuildContext context,
  ) =>
      ({Set? set}) {
        showModalBottomSheet(
          context: context,
          builder: (context) => DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 0.2,
            maxChildSize: 1,
            expand: false,
            builder: (context, scrollController) => SingleChildScrollView(
              controller: scrollController,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: SetForm(set),
              ),
            ),
          ),
        );
      };
}
