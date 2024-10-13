// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flashcardServiceHash() => r'33a4f26f10d5aed9756da72deda8323ddafa8ea6';

/// State might be `null` if user is not on the set page
///
/// Copied from [FlashcardService].
@ProviderFor(FlashcardService)
final flashcardServiceProvider =
    NotifierProvider<FlashcardService, FlashCard?>.internal(
  FlashcardService.new,
  name: r'flashcardServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashcardServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FlashcardService = Notifier<FlashCard?>;
String _$flashcardPagingControllerHash() =>
    r'c03d3840c9d3813e4ce44b8844fc3701ba8975b2';

/// See also [FlashcardPagingController].
@ProviderFor(FlashcardPagingController)
final flashcardPagingControllerProvider = NotifierProvider<
    FlashcardPagingController, PagingController<int, FlashCard>?>.internal(
  FlashcardPagingController.new,
  name: r'flashcardPagingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flashcardPagingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FlashcardPagingController
    = Notifier<PagingController<int, FlashCard>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
