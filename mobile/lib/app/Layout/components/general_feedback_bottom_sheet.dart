import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen_controller.dart';
import 'package:mobile/app_router.dart';
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
  var _feedbackMessage = '';

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
          helper: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    style: Theme.of(context).textTheme.bodySmall,
                    text:
                        'Note: To improve your experience, we collect basic technical data (e.g., OS, phone model) along with your feedback. '),
                TextSpan(
                    text: 'Privacy Policy',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AutoRouter.of(context).push(
                          WebViewRoute(
                            title: 'Privacy Policy',
                            url:
                                'https://www.termsfeed.com/live/60e494f3-2d53-476c-b63c-5bdabd589f2d',
                          ),
                        );
                      }),
              ],
            ),
          ),
          helperMaxLines: 4,
          validator: FormBuilderValidators.required(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _feedbackMessage = value;
              });
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
              disabled: _feedbackMessage.isEmpty,
              onPressed: () {
                ref
                    .watch(feedbackScreenControllerProvider.notifier)
                    .submitGeneralFeedback(
                      title: 'General Feedback',
                      message: _feedbackMessage,
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
