import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/app/Profile/widgets/DeleteDataDialog/delete_data_dialog_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DeleteDataDialog extends ConsumerWidget {
  DeleteDataDialog({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonEnabled = ref.watch(deleteDataDialogControllerProvider);
    final deleteController =
        ref.read(deleteDataDialogControllerProvider.notifier);

    return AlertDialog(
      title: const TypeSetting(
        "Delete your data?",
        variant: TextVariants.headlineSmall,
      ),
      content: FormBuilder(
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
                  borderSide: const BorderSide(color: Colors.black, width: 1),
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
                    text: 'your user',
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
          onPressed: isButtonEnabled
              ? () => deleteController.deleteUser(context)
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          child: TypeSetting(
            "Delete",
            style: TextStyle(
                color: isButtonEnabled ? Colors.white : AppColors.lightGrey),
          ),
        ),
      ],
    );
  }
}
