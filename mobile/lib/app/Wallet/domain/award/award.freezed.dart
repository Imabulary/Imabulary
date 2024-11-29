// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'award.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CollectedAward _$CollectedAwardFromJson(Map<String, dynamic> json) {
  return _CollectedAward.fromJson(json);
}

/// @nodoc
mixin _$CollectedAward {
  double get currentBalance => throw _privateConstructorUsedError;
  DateTime get lastAwardedAt => throw _privateConstructorUsedError;
  double get nextAward => throw _privateConstructorUsedError;
  int get expirationTime => throw _privateConstructorUsedError;

  /// Serializes this CollectedAward to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectedAward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectedAwardCopyWith<CollectedAward> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectedAwardCopyWith<$Res> {
  factory $CollectedAwardCopyWith(
          CollectedAward value, $Res Function(CollectedAward) then) =
      _$CollectedAwardCopyWithImpl<$Res, CollectedAward>;
  @useResult
  $Res call(
      {double currentBalance,
      DateTime lastAwardedAt,
      double nextAward,
      int expirationTime});
}

/// @nodoc
class _$CollectedAwardCopyWithImpl<$Res, $Val extends CollectedAward>
    implements $CollectedAwardCopyWith<$Res> {
  _$CollectedAwardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectedAward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBalance = null,
    Object? lastAwardedAt = null,
    Object? nextAward = null,
    Object? expirationTime = null,
  }) {
    return _then(_value.copyWith(
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      lastAwardedAt: null == lastAwardedAt
          ? _value.lastAwardedAt
          : lastAwardedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextAward: null == nextAward
          ? _value.nextAward
          : nextAward // ignore: cast_nullable_to_non_nullable
              as double,
      expirationTime: null == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectedAwardImplCopyWith<$Res>
    implements $CollectedAwardCopyWith<$Res> {
  factory _$$CollectedAwardImplCopyWith(_$CollectedAwardImpl value,
          $Res Function(_$CollectedAwardImpl) then) =
      __$$CollectedAwardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double currentBalance,
      DateTime lastAwardedAt,
      double nextAward,
      int expirationTime});
}

/// @nodoc
class __$$CollectedAwardImplCopyWithImpl<$Res>
    extends _$CollectedAwardCopyWithImpl<$Res, _$CollectedAwardImpl>
    implements _$$CollectedAwardImplCopyWith<$Res> {
  __$$CollectedAwardImplCopyWithImpl(
      _$CollectedAwardImpl _value, $Res Function(_$CollectedAwardImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectedAward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBalance = null,
    Object? lastAwardedAt = null,
    Object? nextAward = null,
    Object? expirationTime = null,
  }) {
    return _then(_$CollectedAwardImpl(
      currentBalance: null == currentBalance
          ? _value.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      lastAwardedAt: null == lastAwardedAt
          ? _value.lastAwardedAt
          : lastAwardedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextAward: null == nextAward
          ? _value.nextAward
          : nextAward // ignore: cast_nullable_to_non_nullable
              as double,
      expirationTime: null == expirationTime
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectedAwardImpl implements _CollectedAward {
  const _$CollectedAwardImpl(
      {required this.currentBalance,
      required this.lastAwardedAt,
      required this.nextAward,
      required this.expirationTime});

  factory _$CollectedAwardImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectedAwardImplFromJson(json);

  @override
  final double currentBalance;
  @override
  final DateTime lastAwardedAt;
  @override
  final double nextAward;
  @override
  final int expirationTime;

  @override
  String toString() {
    return 'CollectedAward(currentBalance: $currentBalance, lastAwardedAt: $lastAwardedAt, nextAward: $nextAward, expirationTime: $expirationTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectedAwardImpl &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.lastAwardedAt, lastAwardedAt) ||
                other.lastAwardedAt == lastAwardedAt) &&
            (identical(other.nextAward, nextAward) ||
                other.nextAward == nextAward) &&
            (identical(other.expirationTime, expirationTime) ||
                other.expirationTime == expirationTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentBalance, lastAwardedAt, nextAward, expirationTime);

  /// Create a copy of CollectedAward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectedAwardImplCopyWith<_$CollectedAwardImpl> get copyWith =>
      __$$CollectedAwardImplCopyWithImpl<_$CollectedAwardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectedAwardImplToJson(
      this,
    );
  }
}

abstract class _CollectedAward implements CollectedAward {
  const factory _CollectedAward(
      {required final double currentBalance,
      required final DateTime lastAwardedAt,
      required final double nextAward,
      required final int expirationTime}) = _$CollectedAwardImpl;

  factory _CollectedAward.fromJson(Map<String, dynamic> json) =
      _$CollectedAwardImpl.fromJson;

  @override
  double get currentBalance;
  @override
  DateTime get lastAwardedAt;
  @override
  double get nextAward;
  @override
  int get expirationTime;

  /// Create a copy of CollectedAward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectedAwardImplCopyWith<_$CollectedAwardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Award _$AwardFromJson(Map<String, dynamic> json) {
  return _Award.fromJson(json);
}

/// @nodoc
mixin _$Award {
  String get id => throw _privateConstructorUsedError;
  String get walletId => throw _privateConstructorUsedError;
  DateTime get lastAwardedAt => throw _privateConstructorUsedError;
  int get streekLevel => throw _privateConstructorUsedError;
  int get streekCount => throw _privateConstructorUsedError;
  double get award => throw _privateConstructorUsedError;

  /// Serializes this Award to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AwardCopyWith<Award> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwardCopyWith<$Res> {
  factory $AwardCopyWith(Award value, $Res Function(Award) then) =
      _$AwardCopyWithImpl<$Res, Award>;
  @useResult
  $Res call(
      {String id,
      String walletId,
      DateTime lastAwardedAt,
      int streekLevel,
      int streekCount,
      double award});
}

/// @nodoc
class _$AwardCopyWithImpl<$Res, $Val extends Award>
    implements $AwardCopyWith<$Res> {
  _$AwardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletId = null,
    Object? lastAwardedAt = null,
    Object? streekLevel = null,
    Object? streekCount = null,
    Object? award = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      lastAwardedAt: null == lastAwardedAt
          ? _value.lastAwardedAt
          : lastAwardedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streekLevel: null == streekLevel
          ? _value.streekLevel
          : streekLevel // ignore: cast_nullable_to_non_nullable
              as int,
      streekCount: null == streekCount
          ? _value.streekCount
          : streekCount // ignore: cast_nullable_to_non_nullable
              as int,
      award: null == award
          ? _value.award
          : award // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AwardImplCopyWith<$Res> implements $AwardCopyWith<$Res> {
  factory _$$AwardImplCopyWith(
          _$AwardImpl value, $Res Function(_$AwardImpl) then) =
      __$$AwardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String walletId,
      DateTime lastAwardedAt,
      int streekLevel,
      int streekCount,
      double award});
}

/// @nodoc
class __$$AwardImplCopyWithImpl<$Res>
    extends _$AwardCopyWithImpl<$Res, _$AwardImpl>
    implements _$$AwardImplCopyWith<$Res> {
  __$$AwardImplCopyWithImpl(
      _$AwardImpl _value, $Res Function(_$AwardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletId = null,
    Object? lastAwardedAt = null,
    Object? streekLevel = null,
    Object? streekCount = null,
    Object? award = null,
  }) {
    return _then(_$AwardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      lastAwardedAt: null == lastAwardedAt
          ? _value.lastAwardedAt
          : lastAwardedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      streekLevel: null == streekLevel
          ? _value.streekLevel
          : streekLevel // ignore: cast_nullable_to_non_nullable
              as int,
      streekCount: null == streekCount
          ? _value.streekCount
          : streekCount // ignore: cast_nullable_to_non_nullable
              as int,
      award: null == award
          ? _value.award
          : award // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AwardImpl implements _Award {
  const _$AwardImpl(
      {required this.id,
      required this.walletId,
      required this.lastAwardedAt,
      required this.streekLevel,
      required this.streekCount,
      required this.award});

  factory _$AwardImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwardImplFromJson(json);

  @override
  final String id;
  @override
  final String walletId;
  @override
  final DateTime lastAwardedAt;
  @override
  final int streekLevel;
  @override
  final int streekCount;
  @override
  final double award;

  @override
  String toString() {
    return 'Award(id: $id, walletId: $walletId, lastAwardedAt: $lastAwardedAt, streekLevel: $streekLevel, streekCount: $streekCount, award: $award)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.lastAwardedAt, lastAwardedAt) ||
                other.lastAwardedAt == lastAwardedAt) &&
            (identical(other.streekLevel, streekLevel) ||
                other.streekLevel == streekLevel) &&
            (identical(other.streekCount, streekCount) ||
                other.streekCount == streekCount) &&
            (identical(other.award, award) || other.award == award));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, walletId, lastAwardedAt,
      streekLevel, streekCount, award);

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AwardImplCopyWith<_$AwardImpl> get copyWith =>
      __$$AwardImplCopyWithImpl<_$AwardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AwardImplToJson(
      this,
    );
  }
}

abstract class _Award implements Award {
  const factory _Award(
      {required final String id,
      required final String walletId,
      required final DateTime lastAwardedAt,
      required final int streekLevel,
      required final int streekCount,
      required final double award}) = _$AwardImpl;

  factory _Award.fromJson(Map<String, dynamic> json) = _$AwardImpl.fromJson;

  @override
  String get id;
  @override
  String get walletId;
  @override
  DateTime get lastAwardedAt;
  @override
  int get streekLevel;
  @override
  int get streekCount;
  @override
  double get award;

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AwardImplCopyWith<_$AwardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
