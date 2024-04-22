import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Profile/presentation/profile.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/components/DeleteActionItem/delete_action_item_controller.dart';
import 'package:mobile/app/Set/presentation/set_screen_controller.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/async_value_ui.dart';

// TODO: add 4 tests, on error, on loading, on data and to verify whether the item is rendered correctly
class DeleteActionItem extends ConsumerWidget {
  const DeleteActionItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setsPagingController = ref.read(setsPagingControllerProvider);

    ref.listen(deleteActionItemControllerProvider, (_, state) {
      state.showErrorDialog(context, /* doPop */ true);
      state.showLoadingDialog(context, message: 'Set is being deleted...');

      state.whenData((value) {
        setsPagingController?.refresh();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(initialTabIndex: 1),
          ),
        );
      });
    });

    final set = ref.watch(setServiceProvider);

    final state = ref.watch(setScreenControllerProvider);
    final delete = ref.read(deleteActionItemControllerProvider.notifier).delete;

    return ListTile(
      onTap: state.isLoading ? null : () => delete(set!.id),
      leading: const Icon(Icons.delete_forever_outlined),
      title: const TypeSetting('Delete'),
      subtitle: const TypeSetting(
        'The set will be permanently deleted. Flashcards will remain.',
        variant: TextVariants.bodySmall,
      ),
    );
  }
}
