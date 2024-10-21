import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile/app/Set/application/set_provider.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/presentation/set_screen.dart';
import 'package:mobile/app/Set/presentation/set_screen_controller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/async_value_ui.dart';
import 'package:mobile/shared/constants.dart';

class SetForm extends ConsumerWidget {
  const SetForm(this.set, {super.key});

  final Set? set;

  static final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setsPagingController = ref.read(setsPagingControllerProvider);

    ref.listen((setScreenControllerProvider), (_, state) {
      state.showErrorDialog(context, /* doPop */ false);

      state.whenData((value) {
        final item = value as Set;

        ref.read(setServiceProvider.notifier).openSet(item);

        Navigator.pop(context); // close form

        setsPagingController?.refresh();
        ref.invalidate(findAllSetsProvider);
        ref.invalidate(findInProgressSetsProvider);
        ref.invalidate(findNotStudiedSetsProvider);

        if (set == null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SetScreen(),
            ),
          );
        }
      });
    });

    final state = ref.watch(setScreenControllerProvider);
    final notifier = ref.watch(setScreenControllerProvider.notifier);

    final isLoading = state.isLoading;
    final isError = state.hasError;

    final handleSave = set == null ? notifier.create : notifier.edit(set!);
    final onSave = isLoading && !isError ? null : () => handleSave(_formKey);

    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 8),
          FormBuilderTextField(
            name: 'name',
            maxLength: kMaxSetNameLength,
            initialValue: set?.name,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.maxLength(kMaxSetNameLength),
            ]),
          ),
          const SizedBox(height: 16),
          FormBuilderTextField(
            name: 'description',
            maxLength: kMaxSetDescriptionLength,
            initialValue: set?.description,
            decoration: const InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
            validator: FormBuilderValidators.maxLength(
              kMaxSetDescriptionLength,
              checkNullOrEmpty: false,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onSave,
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
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
