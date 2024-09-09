import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:Imabulary/app/Flashcard/data/flash_card_repository.dart';

final findAllFlashcardsProvider = FutureProvider.autoDispose.family(
  (ref, FindAllFlashcardsDTO findAllFlashcardsDto) =>
      ref.watch(flashCardRepositoryProvider).findAll(findAllFlashcardsDto),
);
