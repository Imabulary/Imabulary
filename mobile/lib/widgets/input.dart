import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.name,
    required this.label,
    this.controller,
    this.maxLines,
    this.helper,
    this.helperText,
    this.helperMaxLines,
    this.clearable = false,
    this.formKey,
    this.validator,
    this.onChanged,
    this.onClear,
  });

  final TextEditingController? controller;
  final String name;
  final String label;
  final int? maxLines;
  final Widget? helper;
  final String? helperText;
  final int? helperMaxLines;
  final bool clearable;
  final GlobalKey<FormBuilderState>? formKey;
  final FormFieldValidator? validator;
  final void Function(String?)? onChanged;
  final void Function()? onClear;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: controller,
      onChanged: onChanged,
      name: name,
      validator: validator,
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        helper: helper,
        helperText: helperText,
        helperMaxLines: helperMaxLines,
        suffixIcon: clearable
            ? IconButton(
                onPressed: () {
                  formKey?.currentState!.fields[name]?.reset();

                  if (onClear != null) {
                    onClear!();
                  }
                },
                icon: const Icon(Icons.clear),
              )
            : null,
      ),
    );
  }
}
