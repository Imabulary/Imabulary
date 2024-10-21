// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_enum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerEnum _$ServerEnumFromJson(Map<String, dynamic> json) {
  return _ServerEnum.fromJson(json);
}

/// @nodoc
mixin _$ServerEnum {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this ServerEnum to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServerEnum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerEnumCopyWith<ServerEnum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerEnumCopyWith<$Res> {
  factory $ServerEnumCopyWith(
          ServerEnum value, $Res Function(ServerEnum) then) =
      _$ServerEnumCopyWithImpl<$Res, ServerEnum>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$ServerEnumCopyWithImpl<$Res, $Val extends ServerEnum>
    implements $ServerEnumCopyWith<$Res> {
  _$ServerEnumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerEnum
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
abstract class _$$ServerEnumImplCopyWith<$Res>
    implements $ServerEnumCopyWith<$Res> {
  factory _$$ServerEnumImplCopyWith(
          _$ServerEnumImpl value, $Res Function(_$ServerEnumImpl) then) =
      __$$ServerEnumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$ServerEnumImplCopyWithImpl<$Res>
    extends _$ServerEnumCopyWithImpl<$Res, _$ServerEnumImpl>
    implements _$$ServerEnumImplCopyWith<$Res> {
  __$$ServerEnumImplCopyWithImpl(
      _$ServerEnumImpl _value, $Res Function(_$ServerEnumImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerEnum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ServerEnumImpl(
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
class _$ServerEnumImpl implements _ServerEnum {
  const _$ServerEnumImpl({required this.id, required this.name});

  factory _$ServerEnumImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerEnumImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'ServerEnum(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerEnumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of ServerEnum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerEnumImplCopyWith<_$ServerEnumImpl> get copyWith =>
      __$$ServerEnumImplCopyWithImpl<_$ServerEnumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerEnumImplToJson(
      this,
    );
  }
}

abstract class _ServerEnum implements ServerEnum {
  const factory _ServerEnum(
      {required final String id,
      required final String name}) = _$ServerEnumImpl;

  factory _ServerEnum.fromJson(Map<String, dynamic> json) =
      _$ServerEnumImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of ServerEnum
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerEnumImplCopyWith<_$ServerEnumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
