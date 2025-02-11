import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen_controller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/widgets/input.dart';

class GeneralFeedbackBottomSheet extends ConsumerStatefulWidget {
  const GeneralFeedbackBottomSheet({super.key});

  @override
  ConsumerState<GeneralFeedbackBottomSheet> createState() =>
      _GeneralFeedbackBottomSheetState();
}

class _GeneralFeedbackBottomSheetState
    extends ConsumerState<GeneralFeedbackBottomSheet> {
  final TextEditingController _feedbackMessageController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomSheetWrapper(
      children: [
        const TypeSetting(
          'How’s the app so far?',
          variant: TextVariants.headlineLarge,
          style: TextStyle(color: AppColors.white),
        ),
        const SizedBox(height: 16),
        Input(
          name: 'Message',
          label: 'Message',
          maxLines: 4,
          helperText:
              'Note: To improve your experience, we collect basic technical data (e.g., OS, phone model) along with your feedback. Privacy Policy',
          helperMaxLines: 4,
          validator: FormBuilderValidators.required(),
          onChanged: (value) {
            if (value != null) {
              _feedbackMessageController.text = value;
            }
          },
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button(
              onPressed: () => Navigator.pop(context),
              variat: ButtonVariant.text,
              label: 'Close',
            ),
            const SizedBox(width: 8),
            Button(
              disabled: _feedbackMessageController.text.isEmpty,
              onPressed: () {
                ref
                    .watch(feedbackScreenControllerProvider.notifier)
                    .submitGeneralFeedback(
                      title: 'General Feedback',
                      message: _feedbackMessageController.text,
                      screenSize: MediaQuery.sizeOf(context),
                    )();
                context.router.maybePop(true);
              },
              variat: ButtonVariant.outlined,
              label: 'Submit',
            ),
          ],
        )
      ],
    );
  }
}
