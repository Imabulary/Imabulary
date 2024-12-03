import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/application/auth_provider.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/app/Profile/widgets/DeleteDataDialog/delete_data_dialog_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile/components/dialogs.dart';

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
      title:
          isUserEmailExists ? "Delete your data?" : 'Are you absolutely sure?',
      customContent: !isUserEmailExists
          ? null
          : FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormBuilderTextField(
                    name: 'email',
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'example@mail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _formKey.currentState?.fields['email']?.didChange('');
                          deleteController.checkEmailMatch('');
                        },
                      ),
                    ),
                    onChanged: (value) {
                      deleteController.checkEmailMatch(value ?? '');
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text.rich(
                    TextSpan(
                      text: 'Please type ',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'your',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: ' email to confirm.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const TypeSetting(
            "Close",
            style: TextStyle(color: AppColors.primary),
          ),
        ),
        ElevatedButton(
          onPressed: formState.isButtonEnabled || !isUserEmailExists
              ? () => deleteController.deleteUser(context)
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          child: TypeSetting(
            "Delete",
            style: TextStyle(
                color: formState.isButtonEnabled || !isUserEmailExists
                    ? Colors.white
                    : AppColors.lightGrey),
          ),
        ),
      ],
    );
  }
}
