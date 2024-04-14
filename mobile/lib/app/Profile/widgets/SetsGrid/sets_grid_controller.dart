import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/widgets/set_form.dart';

class SetsGridController {
  static void Function() showSetFormBottomSheet(BuildContext context) => () {
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
                padding: const EdgeInsets.all(16),
                child: SetForm(),
              ),
            ),
          ),
        );
      };
}
