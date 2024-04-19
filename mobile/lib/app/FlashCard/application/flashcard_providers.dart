import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

final homeFlashCardsProvider = FutureProvider.autoDispose((ref) => ref
    .watch(flashCardRepositoryProvider)
    .findAll(const Pagination(page: 1, limit: 10)));
