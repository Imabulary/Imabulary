import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/data/dto/feedback_dto.dart';
import 'package:mobile/app/ObjectsOnImage/widgets/NoDesiredObject/no_desired_object_controller.dart';
import 'package:mobile/app/ObjectsOnImage/widgets/NoDesiredObjectDialog/no_desired_obect_dialog.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/utils/async_value_ui.dart';
import 'package:mobile/widgets/list_item.dart';

class NoDesiredObject extends ConsumerWidget {
  const NoDesiredObject({
    super.key,
    required this.imageUrl,
    required this.objectsOnImage,
  });

  final String imageUrl;
  final List<String> objectsOnImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(noDesiredObjectControllerProvider, (_, state) {
      state.showLoadingDialog(context);
      state.showErrorDialog(context, true);

      state.whenData((value) {
        showDialog(
          context: context,
          builder: (context) => const NoDesiredObectDialog(),
        );
      });
    });

    final state = ref.watch(noDesiredObjectControllerProvider);
    final createNoDiseredObjectFeedback = state.isLoading
        ? null
        : ref
            .read(noDesiredObjectControllerProvider.notifier)
            .createNoDiseredObjectFeedback;

    return ListItem(
      onTap: createNoDiseredObjectFeedback != null
          ? () {
              createNoDiseredObjectFeedback(CreateNoDiseredObjectDTO(
                imageUrl: imageUrl,
                objectsOnImage: objectsOnImage,
              ));
            }
          : null,
      tileColor: AppColors.muted,
      label: 'The object I wanted is not in this list',
    );
  }
}
