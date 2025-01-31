import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen_controller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';
import 'package:mobile/components/button.dart';

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
        FormBuilderTextField(
          name: 'message',
          controller: _feedbackMessageController,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          onSubmitted: (_) => FocusScope.of(context).unfocus(),
          decoration: const InputDecoration(
            labelText: 'Message',
            hintText: 'Hi, I want to share...',
            hintStyle: TextStyle(color: AppColors.biege),
            helperText:
                'Note: To improve your experience, we collect basic technical data (e.g., OS, phone model) along with your feedback. Privacy Policy',
            helperMaxLines: 4,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.biege),
            ),
          ),
          style: const TextStyle(color: AppColors.lightGrey),
          maxLines: 4,
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
              onPressed: _feedbackMessageController.text.isEmpty
                  ? null
                  : () {
                      ref
                          .watch(feedbackScreenControllerProvider.notifier)
                          .submitFeedback(
                            message: _feedbackMessageController.text,
                            screenSize: MediaQuery.sizeOf(context),
                          )();
                      Navigator.pop(context);
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
