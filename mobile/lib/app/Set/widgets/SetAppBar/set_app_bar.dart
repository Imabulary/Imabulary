import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Set/application/set_service.dart';
import 'package:Imabulary/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:Imabulary/atoms/colors.dart';
import 'package:Imabulary/atoms/type_setting.dart';

// TODO: add tests to test onClick handler and rendering
class SetAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const SetAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = ref.watch(setServiceProvider);

    return AppBar(
      title: TypeSetting(
        set!.name,
        variant: TextVariants.headlineMedium,
      ),
      actions: [
        ElevatedButton(
          onPressed: SetAppBarController.startQuiz(context, set.flashcards),
          child: const TypeSetting(
            'Learn',
            style: TextStyle(color: AppColors.primary),
          ),
        ),
        IconButton(
          onPressed: SetAppBarController.showActionsBottomSheet(context),
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
