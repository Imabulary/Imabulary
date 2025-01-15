// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get id => throw _privateConstructorUsedError;
  String get internalId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get externalId => throw _privateConstructorUsedError;
  Benefits get benefits => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String id,
      String internalId,
      String name,
      String description,
      String? externalId,
      Benefits benefits});

  $BenefitsCopyWith<$Res> get benefits;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? internalId = null,
    Object? name = null,
    Object? description = null,
    Object? externalId = freezed,
    Object? benefits = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      internalId: null == internalId
          ? _value.internalId
          : internalId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      benefits: null == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as Benefits,
    ) as $Val);
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BenefitsCopyWith<$Res> get benefits {
    return $BenefitsCopyWith<$Res>(_value.benefits, (value) {
      return _then(_value.copyWith(benefits: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String internalId,
      String name,
      String description,
      String? externalId,
      Benefits benefits});

  @override
  $BenefitsCopyWith<$Res> get benefits;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? internalId = null,
    Object? name = null,
    Object? description = null,
    Object? externalId = freezed,
    Object? benefits = null,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      internalId: null == internalId
          ? _value.internalId
          : internalId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      benefits: null == benefits
          ? _value.benefits
          : benefits // ignore: cast_nullable_to_non_nullable
              as Benefits,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {required this.id,
      required this.internalId,
      required this.name,
      required this.description,
      this.externalId,
      required this.benefits});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String id;
  @override
  final String internalId;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? externalId;
  @override
  final Benefits benefits;

  @override
  String toString() {
    return 'Product(id: $id, internalId: $internalId, name: $name, description: $description, externalId: $externalId, benefits: $benefits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.internalId, internalId) ||
                other.internalId == internalId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.benefits, benefits) ||
                other.benefits == benefits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, internalId, name, description, externalId, benefits);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {required final String id,
      required final String internalId,
      required final String name,
      required final String description,
      final String? externalId,
      required final Benefits benefits}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get id;
  @override
  String get internalId;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get externalId;
  @override
  Benefits get benefits;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Benefits _$BenefitsFromJson(Map<String, dynamic> json) {
  return _Benefits.fromJson(json);
}

/// @nodoc
mixin _$Benefits {
  bool get ads => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  int get coins => throw _privateConstructorUsedError;
  String get coinsFrequency => throw _privateConstructorUsedError;
  int? get flashcardsInSet => throw _privateConstructorUsedError;

  /// Serializes this Benefits to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Benefits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BenefitsCopyWith<Benefits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BenefitsCopyWith<$Res> {
  factory $BenefitsCopyWith(Benefits value, $Res Function(Benefits) then) =
      _$BenefitsCopyWithImpl<$Res, Benefits>;
  @useResult
  $Res call(
      {bool ads,
      int sets,
      int coins,
      String coinsFrequency,
      int? flashcardsInSet});
}

/// @nodoc
class _$BenefitsCopyWithImpl<$Res, $Val extends Benefits>
    implements $BenefitsCopyWith<$Res> {
  _$BenefitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Benefits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ads = null,
    Object? sets = null,
    Object? coins = null,
    Object? coinsFrequency = null,
    Object? flashcardsInSet = freezed,
  }) {
    return _then(_value.copyWith(
      ads: null == ads
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as bool,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      coinsFrequency: null == coinsFrequency
          ? _value.coinsFrequency
          : coinsFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardsInSet: freezed == flashcardsInSet
          ? _value.flashcardsInSet
          : flashcardsInSet // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BenefitsImplCopyWith<$Res>
    implements $BenefitsCopyWith<$Res> {
  factory _$$BenefitsImplCopyWith(
          _$BenefitsImpl value, $Res Function(_$BenefitsImpl) then) =
      __$$BenefitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool ads,
      int sets,
      int coins,
      String coinsFrequency,
      int? flashcardsInSet});
}

/// @nodoc
class __$$BenefitsImplCopyWithImpl<$Res>
    extends _$BenefitsCopyWithImpl<$Res, _$BenefitsImpl>
    implements _$$BenefitsImplCopyWith<$Res> {
  __$$BenefitsImplCopyWithImpl(
      _$BenefitsImpl _value, $Res Function(_$BenefitsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Benefits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ads = null,
    Object? sets = null,
    Object? coins = null,
    Object? coinsFrequency = null,
    Object? flashcardsInSet = freezed,
  }) {
    return _then(_$BenefitsImpl(
      ads: null == ads
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as bool,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      coinsFrequency: null == coinsFrequency
          ? _value.coinsFrequency
          : coinsFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardsInSet: freezed == flashcardsInSet
          ? _value.flashcardsInSet
          : flashcardsInSet // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BenefitsImpl implements _Benefits {
  const _$BenefitsImpl(
      {required this.ads,
      required this.sets,
      required this.coins,
      required this.coinsFrequency,
      this.flashcardsInSet});

  factory _$BenefitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BenefitsImplFromJson(json);

  @override
  final bool ads;
  @override
  final int sets;
  @override
  final int coins;
  @override
  final String coinsFrequency;
  @override
  final int? flashcardsInSet;

  @override
  String toString() {
    return 'Benefits(ads: $ads, sets: $sets, coins: $coins, coinsFrequency: $coinsFrequency, flashcardsInSet: $flashcardsInSet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BenefitsImpl &&
            (identical(other.ads, ads) || other.ads == ads) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.coinsFrequency, coinsFrequency) ||
                other.coinsFrequency == coinsFrequency) &&
            (identical(other.flashcardsInSet, flashcardsInSet) ||
                other.flashcardsInSet == flashcardsInSet));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, ads, sets, coins, coinsFrequency, flashcardsInSet);

  /// Create a copy of Benefits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BenefitsImplCopyWith<_$BenefitsImpl> get copyWith =>
      __$$BenefitsImplCopyWithImpl<_$BenefitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BenefitsImplToJson(
      this,
    );
  }
}

abstract class _Benefits implements Benefits {
  const factory _Benefits(
      {required final bool ads,
      required final int sets,
      required final int coins,
      required final String coinsFrequency,
      final int? flashcardsInSet}) = _$BenefitsImpl;

  factory _Benefits.fromJson(Map<String, dynamic> json) =
      _$BenefitsImpl.fromJson;

  @override
  bool get ads;
  @override
  int get sets;
  @override
  int get coins;
  @override
  String get coinsFrequency;
  @override
  int? get flashcardsInSet;

  /// Create a copy of Benefits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BenefitsImplCopyWith<_$BenefitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
