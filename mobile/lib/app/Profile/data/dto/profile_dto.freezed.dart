// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) {
  return _ProfileDTO.fromJson(json);
}

/// @nodoc
mixin _$ProfileDTO {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this ProfileDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileDTOCopyWith<ProfileDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDTOCopyWith<$Res> {
  factory $ProfileDTOCopyWith(
          ProfileDTO value, $Res Function(ProfileDTO) then) =
      _$ProfileDTOCopyWithImpl<$Res, ProfileDTO>;
  @useResult
  $Res call({String uid, String email});
}

/// @nodoc
class _$ProfileDTOCopyWithImpl<$Res, $Val extends ProfileDTO>
    implements $ProfileDTOCopyWith<$Res> {
  _$ProfileDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileDTOImplCopyWith<$Res>
    implements $ProfileDTOCopyWith<$Res> {
  factory _$$ProfileDTOImplCopyWith(
          _$ProfileDTOImpl value, $Res Function(_$ProfileDTOImpl) then) =
      __$$ProfileDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String email});
}

/// @nodoc
class __$$ProfileDTOImplCopyWithImpl<$Res>
    extends _$ProfileDTOCopyWithImpl<$Res, _$ProfileDTOImpl>
    implements _$$ProfileDTOImplCopyWith<$Res> {
  __$$ProfileDTOImplCopyWithImpl(
      _$ProfileDTOImpl _value, $Res Function(_$ProfileDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
  }) {
    return _then(_$ProfileDTOImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDTOImpl implements _ProfileDTO {
  const _$ProfileDTOImpl({required this.uid, required this.email});

  factory _$ProfileDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDTOImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;

  @override
  String toString() {
    return 'ProfileDTO(uid: $uid, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDTOImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email);

  /// Create a copy of ProfileDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDTOImplCopyWith<_$ProfileDTOImpl> get copyWith =>
      __$$ProfileDTOImplCopyWithImpl<_$ProfileDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDTOImplToJson(
      this,
    );
  }
}

abstract class _ProfileDTO implements ProfileDTO {
  const factory _ProfileDTO(
      {required final String uid,
      required final String email}) = _$ProfileDTOImpl;

  factory _ProfileDTO.fromJson(Map<String, dynamic> json) =
      _$ProfileDTOImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;

  /// Create a copy of ProfileDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileDTOImplCopyWith<_$ProfileDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
