// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizStatusesPayload {
  ServerEnum get notStudied => throw _privateConstructorUsedError;
  ServerEnum get stillLearning => throw _privateConstructorUsedError;
  ServerEnum get mastered => throw _privateConstructorUsedError;

  /// Create a copy of QuizStatusesPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizStatusesPayloadCopyWith<QuizStatusesPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStatusesPayloadCopyWith<$Res> {
  factory $QuizStatusesPayloadCopyWith(
          QuizStatusesPayload value, $Res Function(QuizStatusesPayload) then) =
      _$QuizStatusesPayloadCopyWithImpl<$Res, QuizStatusesPayload>;
  @useResult
  $Res call(
      {ServerEnum notStudied, ServerEnum stillLearning, ServerEnum mastered});

  $ServerEnumCopyWith<$Res> get notStudied;
  $ServerEnumCopyWith<$Res> get stillLearning;
  $ServerEnumCopyWith<$Res> get mastered;
}

/// @nodoc
class _$QuizStatusesPayloadCopyWithImpl<$Res, $Val extends QuizStatusesPayload>
    implements $QuizStatusesPayloadCopyWith<$Res> {
  _$QuizStatusesPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizStatusesPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notStudied = null,
    Object? stillLearning = null,
    Object? mastered = null,
  }) {
    return _then(_value.copyWith(
      notStudied: null == notStudied
          ? _value.notStudied
          : notStudied // ignore: cast_nullable_to_non_nullable
              as ServerEnum,
      stillLearning: null == stillLearning
          ? _value.stillLearning
          : stillLearning // ignore: cast_nullable_to_non_nullable
              as ServerEnum,
      mastered: null == mastered
          ? _value.mastered
          : mastered // ignore: cast_nullable_to_non_nullable
              as ServerEnum,
    ) as $Val);
  }

  /// Create a copy of QuizStatusesPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerEnumCopyWith<$Res> get notStudied {
    return $ServerEnumCopyWith<$Res>(_value.notStudied, (value) {
      return _then(_value.copyWith(notStudied: value) as $Val);
    });
  }

  /// Create a copy of QuizStatusesPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerEnumCopyWith<$Res> get stillLearning {
    return $ServerEnumCopyWith<$Res>(_value.stillLearning, (value) {
      return _then(_value.copyWith(stillLearning: value) as $Val);
    });
  }

  /// Create a copy of QuizStatusesPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerEnumCopyWith<$Res> get mastered {
    return $ServerEnumCopyWith<$Res>(_value.mastered, (value) {
      return _then(_value.copyWith(mastered: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizStatusesPayloadImplCopyWith<$Res>
    implements $QuizStatusesPayloadCopyWith<$Res> {
  factory _$$QuizStatusesPayloadImplCopyWith(_$QuizStatusesPayloadImpl value,
          $Res Function(_$QuizStatusesPayloadImpl) then) =
      __$$QuizStatusesPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ServerEnum notStudied, ServerEnum stillLearning, ServerEnum mastered});

  @override
  $ServerEnumCopyWith<$Res> get notStudied;
  @override
  $ServerEnumCopyWith<$Res> get stillLearning;
  @override
  $ServerEnumCopyWith<$Res> get mastered;
}

/// @nodoc
class __$$QuizStatusesPayloadImplCopyWithImpl<$Res>
    extends _$QuizStatusesPayloadCopyWithImpl<$Res, _$QuizStatusesPayloadImpl>
    implements _$$QuizStatusesPayloadImplCopyWith<$Res> {
  __$$QuizStatusesPayloadImplCopyWithImpl(_$QuizStatusesPayloadImpl _value,
      $Res Function(_$QuizStatusesPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizStatusesPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notStudied = null,
    Object? stillLearning = null,
    Object? mastered = null,
  }) {
    return _then(_$QuizStatusesPayloadImpl(
      notStudied: null == notStudied
          ? _value.notStudied
          : notStudied // ignore: cast_nullable_to_non_nullable
              as ServerEnum,
      stillLearning: null == stillLearning
          ? _value.stillLearning
          : stillLearning // ignore: cast_nullable_to_non_nullable
              as ServerEnum,
      mastered: null == mastered
          ? _value.mastered
          : mastered // ignore: cast_nullable_to_non_nullable
              as ServerEnum,
    ));
  }
}

/// @nodoc

class _$QuizStatusesPayloadImpl implements _QuizStatusesPayload {
  const _$QuizStatusesPayloadImpl(
      {required this.notStudied,
      required this.stillLearning,
      required this.mastered});

  @override
  final ServerEnum notStudied;
  @override
  final ServerEnum stillLearning;
  @override
  final ServerEnum mastered;

  @override
  String toString() {
    return 'QuizStatusesPayload(notStudied: $notStudied, stillLearning: $stillLearning, mastered: $mastered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizStatusesPayloadImpl &&
            (identical(other.notStudied, notStudied) ||
                other.notStudied == notStudied) &&
            (identical(other.stillLearning, stillLearning) ||
                other.stillLearning == stillLearning) &&
            (identical(other.mastered, mastered) ||
                other.mastered == mastered));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, notStudied, stillLearning, mastered);

  /// Create a copy of QuizStatusesPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizStatusesPayloadImplCopyWith<_$QuizStatusesPayloadImpl> get copyWith =>
      __$$QuizStatusesPayloadImplCopyWithImpl<_$QuizStatusesPayloadImpl>(
          this, _$identity);
}

abstract class _QuizStatusesPayload implements QuizStatusesPayload {
  const factory _QuizStatusesPayload(
      {required final ServerEnum notStudied,
      required final ServerEnum stillLearning,
      required final ServerEnum mastered}) = _$QuizStatusesPayloadImpl;

  @override
  ServerEnum get notStudied;
  @override
  ServerEnum get stillLearning;
  @override
  ServerEnum get mastered;

  /// Create a copy of QuizStatusesPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizStatusesPayloadImplCopyWith<_$QuizStatusesPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
