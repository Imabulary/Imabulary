import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Set/data/dto/set_dto.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/utils/fp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/Pagination/pagination.dart';
import '../../Flashcard/data/dto/flashcard_dto.dart';

part 'set_screen_controller.g.dart';

@riverpod
class SetScreenController extends _$SetScreenController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<List<FlashCard>> fetchFlashcards({required String setId}) async {
    final flashCardsRepository = ref.watch(flashCardRepositoryProvider);

    final flashcards = await flashCardsRepository.findAll(
      FindAllFlashcardsDTO(pagination: const Pagination(), setId: setId),
    );

    return flashcards.result;
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
  Future Function(GlobalKey<FormBuilderState> formKey) edit(Set set) {
    return (GlobalKey<FormBuilderState> formKey) async {
      final setRepository = ref.read(setRepositoryProvider);

      final setDto = _transform(formKey, set: set);

      if (setDto == null) return;

      state = const AsyncLoading();
      state = await AsyncValue.guard(
        () => setRepository.update(set.id, setDto),
      );
    };
  }

  SetDTO? _transform(GlobalKey<FormBuilderState> formKey, {Set? set}) {
    final formState = formKey.currentState;

    if (formState != null && formState.saveAndValidate()) {
      final formValue = set != null
          ? diff(
              set.toJson(),
              formState.value,
            )
          : formState.value;

      return SetDTO.fromJson(formValue);
    }

    return null;
  }
}
