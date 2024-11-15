import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/atoms/type_setting.dart';

class FlashcardsSettingsList extends ConsumerWidget {
  const FlashcardsSettingsList({super.key, this.toggleDeleteMode});
  final void Function()? toggleDeleteMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          key: const Key('delete'),
          onTap: () async {
            toggleDeleteMode!();
            Navigator.pop(context);
          },
          title: const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.delete_forever),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TypeSetting(
                        variant: TextVariants.bodyLarge,
                        'Delete flashcards',
                        style: TextStyle(color: Colors.white),
                      ),
                      TypeSetting(
                        variant: TextVariants.bodySmall,
                        'You will NOT get your coin back for deleting a flashcards',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
