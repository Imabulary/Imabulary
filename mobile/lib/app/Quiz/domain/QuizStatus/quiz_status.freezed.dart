// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizStatus _$QuizStatusFromJson(Map<String, dynamic> json) {
  return _QuizStatus.fromJson(json);
}

/// @nodoc
mixin _$QuizStatus {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this QuizStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizStatusCopyWith<QuizStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStatusCopyWith<$Res> {
  factory $QuizStatusCopyWith(
          QuizStatus value, $Res Function(QuizStatus) then) =
      _$QuizStatusCopyWithImpl<$Res, QuizStatus>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$QuizStatusCopyWithImpl<$Res, $Val extends QuizStatus>
    implements $QuizStatusCopyWith<$Res> {
  _$QuizStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizStatusImplCopyWith<$Res>
    implements $QuizStatusCopyWith<$Res> {
  factory _$$QuizStatusImplCopyWith(
          _$QuizStatusImpl value, $Res Function(_$QuizStatusImpl) then) =
      __$$QuizStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$QuizStatusImplCopyWithImpl<$Res>
    extends _$QuizStatusCopyWithImpl<$Res, _$QuizStatusImpl>
    implements _$$QuizStatusImplCopyWith<$Res> {
  __$$QuizStatusImplCopyWithImpl(
      _$QuizStatusImpl _value, $Res Function(_$QuizStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$QuizStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizStatusImpl implements _QuizStatus {
  const _$QuizStatusImpl({required this.id, required this.name});

  factory _$QuizStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizStatusImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'QuizStatus(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of QuizStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizStatusImplCopyWith<_$QuizStatusImpl> get copyWith =>
      __$$QuizStatusImplCopyWithImpl<_$QuizStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizStatusImplToJson(
      this,
    );
  }
}

abstract class _QuizStatus implements QuizStatus {
  const factory _QuizStatus(
      {required final String id,
      required final String name}) = _$QuizStatusImpl;

  factory _QuizStatus.fromJson(Map<String, dynamic> json) =
      _$QuizStatusImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of QuizStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizStatusImplCopyWith<_$QuizStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
