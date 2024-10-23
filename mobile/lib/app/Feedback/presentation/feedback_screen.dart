import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/application/feedback_provider.dart';
import 'package:mobile/app/Feedback/application/feedback_service.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class FeedbackScreen extends ConsumerWidget {
  const FeedbackScreen({super.key});

  // _onCategorySelect

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackCategories = ref.watch(findAllFeedbackCategoriesProvider);
    final selectedCategories = ref.watch(feedbackServiceProvider);
    final onCategorySelect =
        ref.read(feedbackServiceProvider.notifier).onCategorySelect;

    return Layout(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TypeSetting(
            "We are very sorry. Let us know what happened and we'll fix it",
            variant: TextVariants.headlineMedium,
            // textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          TypeSetting(
            "You can choose several options",
            variant: TextVariants.bodySmall,
            style: TextStyle(color: AppColors.lightGrey),
          ),
          const SizedBox(
            height: 16,
          ),
          feedbackCategories.when(
            data: (data) => Flexible(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: data.result
                    .map(
                      (category) => CheckboxListTile(
                        title: TypeSetting(category.name),
                        value: selectedCategories.any(
                          (selectedCategory) =>
                              selectedCategory.id == category.id,
                        ),
                        onChanged: (_) {
                          onCategorySelect(category);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            error: (error, _) => TypeSetting('Oops, something went wrong'),
            loading: () => TypeSetting('Loading...'),
          )
        ],
      ),
      appBar: AppBar(
        title: TypeSetting(
          'Provide a feedback',
          variant: TextVariants.headlineLarge,
        ),
      ),
    );
  }
}
