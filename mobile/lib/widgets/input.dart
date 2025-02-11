import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.name,
    required this.label,
    this.maxLines,
    this.helperText,
    this.helperMaxLines,
    this.clearable = false,
    this.formKey,
    this.validator,
    this.onChanged,
    this.onClear,
  });

  final String name;
  final String label;
  final int? maxLines;
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
      onChanged: onChanged,
      name: name,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
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
