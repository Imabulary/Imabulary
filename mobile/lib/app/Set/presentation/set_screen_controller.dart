import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile/app/Set/data/dto/set_dto.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_screen_controller.g.dart';

@riverpod
class SetScreenController extends _$SetScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  // TODO: add tests
  Future create(GlobalKey<FormBuilderState> formKey) async {
    final setRepository = ref.read(setRepositoryProvider);

    final setDto = _transform(formKey);

    if (setDto == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => setRepository.create(setDto));
  }

  // TODO: add tests
  Future Function(GlobalKey<FormBuilderState> formKey) edit(String id) {
    return (GlobalKey<FormBuilderState> formKey) async {
      final setRepository = ref.read(setRepositoryProvider);

      final setDto = _transform(formKey);

      if (setDto == null) return;

      state = const AsyncLoading();
      state = await AsyncValue.guard(() => setRepository.update(id, setDto));
    };
  }

  SetDTO? _transform(GlobalKey<FormBuilderState> formKey) {
    final formState = formKey.currentState;

    if (formState != null && formState.saveAndValidate()) {
      return SetDTO.fromJson(formState.value);
    }

    return null;
  }
}
