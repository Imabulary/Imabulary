import 'package:mobile/app/FlashCard/flash_card_repository.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:riverpod/riverpod.dart';

final homeFlashCardsProvider = FutureProvider.autoDispose((ref) => ref
    .watch(flashCardRepositoryProvider)
    .findAll(const Pagination(page: 1, limit: 10)));
