import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';
import 'package:mobile/widgets/list_item.dart';
import 'package:mobile/app/Set/domain/set.dart';

class SetsQuizzesList extends ConsumerWidget {
  const SetsQuizzesList({super.key, required this.sets});

  final List<Set> sets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setService = ref.read(setServiceProvider.notifier);

    return BottomSheetWrapper(
      children: [
        const TypeSetting(
          'Select a set',
          variant: TextVariants.headlineLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        const TypeSetting(
          'Please select a set to start a quiz.',
          style: TextStyle(color: AppColors.lightGrey),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: sets.length,
            itemBuilder: (context, index) => ListItem(
              onTap: () {
                setService.openSet(sets[index]);
                SetAppBarController.startQuiz(
                  context,
                  sets[index].flashcards,
                );
              },
              contentPadding: const EdgeInsets.only(
                top: 10,
                right: 10,
                bottom: 10,
              ),
              label: sets[index].name,
              image: sets[index].flashcards![0].image_url,
            ),
          ),
        ),
      ],
    );
  }
}
