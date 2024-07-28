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

Award _$AwardFromJson(Map<String, dynamic> json) {
  return _Award.fromJson(json);
}

/// @nodoc
mixin _$Award {
  double get currentBalance => throw _privateConstructorUsedError;
  DateTime get lastAwardedAt => throw _privateConstructorUsedError;
  double get nextAward => throw _privateConstructorUsedError;
  int get expirationTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AwardCopyWith<Award> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwardCopyWith<$Res> {
  factory $AwardCopyWith(Award value, $Res Function(Award) then) =
      _$AwardCopyWithImpl<$Res, Award>;
  @useResult
  $Res call(
      {double currentBalance,
      DateTime lastAwardedAt,
      double nextAward,
      int expirationTime});
}

/// @nodoc
class _$AwardCopyWithImpl<$Res, $Val extends Award>
    implements $AwardCopyWith<$Res> {
  _$AwardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$AwardImplCopyWith<$Res> implements $AwardCopyWith<$Res> {
  factory _$$AwardImplCopyWith(
          _$AwardImpl value, $Res Function(_$AwardImpl) then) =
      __$$AwardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double currentBalance,
      DateTime lastAwardedAt,
      double nextAward,
      int expirationTime});
}

/// @nodoc
class __$$AwardImplCopyWithImpl<$Res>
    extends _$AwardCopyWithImpl<$Res, _$AwardImpl>
    implements _$$AwardImplCopyWith<$Res> {
  __$$AwardImplCopyWithImpl(
      _$AwardImpl _value, $Res Function(_$AwardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBalance = null,
    Object? lastAwardedAt = null,
    Object? nextAward = null,
    Object? expirationTime = null,
  }) {
    return _then(_$AwardImpl(
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
class _$AwardImpl implements _Award {
  const _$AwardImpl(
      {required this.currentBalance,
      required this.lastAwardedAt,
      required this.nextAward,
      required this.expirationTime});

  factory _$AwardImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwardImplFromJson(json);

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
    return 'Award(currentBalance: $currentBalance, lastAwardedAt: $lastAwardedAt, nextAward: $nextAward, expirationTime: $expirationTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwardImpl &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.lastAwardedAt, lastAwardedAt) ||
                other.lastAwardedAt == lastAwardedAt) &&
            (identical(other.nextAward, nextAward) ||
                other.nextAward == nextAward) &&
            (identical(other.expirationTime, expirationTime) ||
                other.expirationTime == expirationTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentBalance, lastAwardedAt, nextAward, expirationTime);

  @JsonKey(ignore: true)
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
      {required final double currentBalance,
      required final DateTime lastAwardedAt,
      required final double nextAward,
      required final int expirationTime}) = _$AwardImpl;

  factory _Award.fromJson(Map<String, dynamic> json) = _$AwardImpl.fromJson;

  @override
  double get currentBalance;
  @override
  DateTime get lastAwardedAt;
  @override
  double get nextAward;
  @override
  int get expirationTime;
  @override
  @JsonKey(ignore: true)
  _$$AwardImplCopyWith<_$AwardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
