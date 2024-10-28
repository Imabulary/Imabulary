import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile/app/Feedback/application/feedback_provider.dart';
import 'package:mobile/app/Feedback/application/feedback_service.dart';
import 'package:mobile/app/Feedback/domain/feedback.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen_controller.dart';
import 'package:mobile/app/Feedback/widgets/feedback_received_dialog.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/utils/async_value_ui.dart';
import 'package:mobile/widgets/input.dart';

class FeedbackScreen extends ConsumerStatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends ConsumerState<FeedbackScreen> {
  _onCancel() {
    Navigator.pop(context);
  }

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(feedbackScreenControllerProvider, (_, state) {
      state.showErrorDialog(context, true);

      state.whenData((value) {
        final isFeedbackReceived = value as bool;

        if (isFeedbackReceived) {
          ref.invalidate(getWalletBalanceProvider);
          ref.invalidate(findAllFlashcardsProvider);

          showDialog(
            context: context,
            builder: (context) => FeedbackReceivedDialog(),
          );
        }
      });
    });

    final feedbackCategories = ref.watch(findAllFeedbackCategoriesProvider);
    final state = ref.watch(feedbackScreenControllerProvider);
    final notifier = ref.watch(feedbackScreenControllerProvider.notifier);

    final isLoading = state.isLoading;
    final isError = state.hasError;

    final onSubmit = isLoading && !isError ? null : notifier.dislike(_formKey);

    final onCategorySelect =
        ref.read(feedbackServiceProvider.notifier).onCategorySelect;

    final isSelectedCategoriesEmpty = ref.watch(
      isSelectedCategoriesEmptyProvider,
    );

    final isOtherCategorySelected = ref.watch(
      isCategorySelectedProvider(kOtherFeedbackCategory.id),
    );

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
              "Note: this flashcard will be deleted once you submit a feedback",
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
              value: isOtherCategorySelected,
              onChanged: (_) {
                onCategorySelect(kOtherFeedbackCategory);
              },
            ),
            if (isOtherCategorySelected)
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Input(
                      name: 'text',
                      label: 'Other',
                      helperText: 'Describe what happened',
                      clearable: true,
                      formKey: _formKey,
                      validator: FormBuilderValidators.required(),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  label: 'Cancel',
                  onPressed: _onCancel,
                  variat: ButtonVariant.text,
                  disabled: isLoading,
                ),
                const SizedBox(
                  width: 8,
                ),
                Button(
                  label: isLoading ? 'Submiting the feedback...' : 'Submit',
                  onPressed: onSubmit,
                  disabled: isLoading || isSelectedCategoriesEmpty,
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
