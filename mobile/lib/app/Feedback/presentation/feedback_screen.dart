import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/application/feedback_provider.dart';
import 'package:mobile/app/Feedback/application/feedback_service.dart';
import 'package:mobile/app/Feedback/domain/FeedbackCategory/feedback_category.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';

class FeedbackScreen extends ConsumerStatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends ConsumerState<FeedbackScreen> {
  _onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final feedbackCategories = ref.watch(findAllFeedbackCategoriesProvider);
    final onCategorySelect =
        ref.read(feedbackServiceProvider.notifier).onCategorySelect;
    final isSelectedCategoriesEmpty =
        ref.watch(isSelectedCategoriesEmptyProvider);

    return Layout(
      feedbackCategories.when(
        data: (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TypeSetting(
              "We're very sorry. Let us know what happened and we'll fix it",
              variant: TextVariants.headlineMedium,
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
            Flexible(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: data.result
                    .map(
                      (category) => CheckboxListTile(
                        title: TypeSetting(category.name),
                        value: ref.watch(
                          isCategorySelectedProvider(category.id),
                        ),
                        onChanged: (_) {
                          onCategorySelect(category);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            CheckboxListTile(
              title: TypeSetting(kOtherFeedbackCategory.name),
              value: ref.watch(
                isCategorySelectedProvider(kOtherFeedbackCategory.id),
              ),
              onChanged: (_) {
                onCategorySelect(kOtherFeedbackCategory);
              },
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  label: 'Cancel',
                  onPressed: _onCancel,
                  variat: ButtonVariant.text,
                ),
                const SizedBox(
                  width: 8,
                ),
                Button(
                  label: 'Submit',
                  onPressed: () {},
                  disabled: isSelectedCategoriesEmpty,
                )
              ],
            )
          ],
        ),
        error: (error, _) => TypeSetting('Oops, something went wrong'),
        loading: () => TypeSetting('Loading...'),
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
