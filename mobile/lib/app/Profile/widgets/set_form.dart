import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/presentation/set_screen.dart';
import 'package:mobile/app/Set/presentation/set_screen_controller.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/async_value_ui.dart';

class SetForm extends ConsumerWidget {
  SetForm({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen((setScreenControllerProvider), (_, state) {
      state.showErrorDialog(context, /* doPop */ false);

      state.whenData((value) {
        final set = value as Set;

        ref.read(setServiceProvider.notifier).openSet(set);

        Navigator.pop(context); // close form

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SetScreen(),
          ),
        );
      });
    });

    final state = ref.watch(setScreenControllerProvider);

    final isLoading = state.isLoading;
    final isError = state.hasError;

    final handleSave = ref.read(setScreenControllerProvider.notifier).create;
    final onSave = isLoading && !isError ? null : () => handleSave(_formKey);

    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 8),
          FormBuilderTextField(
            name: 'name',
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: FormBuilderValidators.required(),
          ),
          const SizedBox(height: 16),
          FormBuilderTextField(
            name: 'description',
            decoration: const InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onSave,
            style: ElevatedButton.styleFrom(backgroundColor: colors['primary']),
            child: TypeSetting(
              isLoading && !isError ? 'Saving...' : 'Save',
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
