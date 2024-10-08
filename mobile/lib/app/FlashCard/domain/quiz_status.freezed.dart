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

QuizStatuses _$QuizStatusesFromJson(Map<String, dynamic> json) {
  return _QuizStatuses.fromJson(json);
}

/// @nodoc
mixin _$QuizStatuses {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this QuizStatuses to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizStatuses
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizStatusesCopyWith<QuizStatuses> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStatusesCopyWith<$Res> {
  factory $QuizStatusesCopyWith(
          QuizStatuses value, $Res Function(QuizStatuses) then) =
      _$QuizStatusesCopyWithImpl<$Res, QuizStatuses>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$QuizStatusesCopyWithImpl<$Res, $Val extends QuizStatuses>
    implements $QuizStatusesCopyWith<$Res> {
  _$QuizStatusesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizStatuses
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
abstract class _$$QuizStatusesImplCopyWith<$Res>
    implements $QuizStatusesCopyWith<$Res> {
  factory _$$QuizStatusesImplCopyWith(
          _$QuizStatusesImpl value, $Res Function(_$QuizStatusesImpl) then) =
      __$$QuizStatusesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$QuizStatusesImplCopyWithImpl<$Res>
    extends _$QuizStatusesCopyWithImpl<$Res, _$QuizStatusesImpl>
    implements _$$QuizStatusesImplCopyWith<$Res> {
  __$$QuizStatusesImplCopyWithImpl(
      _$QuizStatusesImpl _value, $Res Function(_$QuizStatusesImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizStatuses
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$QuizStatusesImpl(
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
class _$QuizStatusesImpl implements _QuizStatuses {
  const _$QuizStatusesImpl({required this.id, required this.name});

  factory _$QuizStatusesImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizStatusesImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'QuizStatuses(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizStatusesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of QuizStatuses
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizStatusesImplCopyWith<_$QuizStatusesImpl> get copyWith =>
      __$$QuizStatusesImplCopyWithImpl<_$QuizStatusesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizStatusesImplToJson(
      this,
    );
  }
}

abstract class _QuizStatuses implements QuizStatuses {
  const factory _QuizStatuses(
      {required final String id,
      required final String name}) = _$QuizStatusesImpl;

  factory _QuizStatuses.fromJson(Map<String, dynamic> json) =
      _$QuizStatusesImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of QuizStatuses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizStatusesImplCopyWith<_$QuizStatusesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
