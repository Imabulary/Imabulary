// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$setServiceHash() => r'079a89081f4ee1c162a9f711dc2f12b4ae85de5e';

/// State might be `null` if user is not on the set page
///
/// Copied from [SetService].
@ProviderFor(SetService)
final setServiceProvider = NotifierProvider<SetService, Set?>.internal(
  SetService.new,
  name: r'setServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$setServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SetService = Notifier<Set?>;
String _$setsPagingControllerHash() =>
    r'cd63f7a00332911a335c39f9bded2183e7290bdd';

/// See also [SetsPagingController].
@ProviderFor(SetsPagingController)
final setsPagingControllerProvider = NotifierProvider<SetsPagingController,
    PagingController<int, Set>?>.internal(
  SetsPagingController.new,
  name: r'setsPagingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$setsPagingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SetsPagingController = Notifier<PagingController<int, Set>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
