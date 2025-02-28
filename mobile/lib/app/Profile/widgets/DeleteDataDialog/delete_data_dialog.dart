import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/application/auth_provider.dart';
import 'package:mobile/app/Profile/widgets/DeleteDataDialog/delete_data_dialog_controller.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/dialogs.dart';
import 'package:mobile/utils/analytics_engine.dart';
import 'package:mobile/widgets/input.dart';

class DeleteDataDialog extends ConsumerWidget {
  DeleteDataDialog({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(deleteDataDialogControllerProvider);
    final deleteController =
        ref.read(deleteDataDialogControllerProvider.notifier);

    final user = ref.read(authStateProvider);
    final isUserEmailExists = user.value?.email != null;

    return AppDialog(
      disabled: !formState.isButtonEnabled,
      onSubmit: () {
        analyticsEngine
            .trackClick(AnalyticClickEvents.emailConfirmationDeleteConfirm);
        deleteController.deleteUser(context);
      },
      submitText: "Delete",
      submitColor: ButtonColor.danger,
      title:
          isUserEmailExists ? "Delete your data?" : 'Are you absolutely sure?',
      customContent: !isUserEmailExists
          ? null
          : FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Input(
                    name: 'email',
                    label: 'Email',
                    helperText: 'Please type your email to confirm',
                    clearable: true,
                    onChanged: (value) {
                      deleteController.checkEmailMatch(value ?? '');
                    },
                    onClear: () {
                      deleteController.checkEmailMatch('');
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
