// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return _CreateUserResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateUserResponse {
  Profile get user => throw _privateConstructorUsedError;
  Award get award => throw _privateConstructorUsedError;

  /// Serializes this CreateUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserResponseCopyWith<CreateUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserResponseCopyWith<$Res> {
  factory $CreateUserResponseCopyWith(
          CreateUserResponse value, $Res Function(CreateUserResponse) then) =
      _$CreateUserResponseCopyWithImpl<$Res, CreateUserResponse>;
  @useResult
  $Res call({Profile user, Award award});

  $ProfileCopyWith<$Res> get user;
  $AwardCopyWith<$Res> get award;
}

/// @nodoc
class _$CreateUserResponseCopyWithImpl<$Res, $Val extends CreateUserResponse>
    implements $CreateUserResponseCopyWith<$Res> {
  _$CreateUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? award = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Profile,
      award: null == award
          ? _value.award
          : award // ignore: cast_nullable_to_non_nullable
              as Award,
    ) as $Val);
  }

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get user {
    return $ProfileCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AwardCopyWith<$Res> get award {
    return $AwardCopyWith<$Res>(_value.award, (value) {
      return _then(_value.copyWith(award: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateUserResponseImplCopyWith<$Res>
    implements $CreateUserResponseCopyWith<$Res> {
  factory _$$CreateUserResponseImplCopyWith(_$CreateUserResponseImpl value,
          $Res Function(_$CreateUserResponseImpl) then) =
      __$$CreateUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Profile user, Award award});

  @override
  $ProfileCopyWith<$Res> get user;
  @override
  $AwardCopyWith<$Res> get award;
}

/// @nodoc
class __$$CreateUserResponseImplCopyWithImpl<$Res>
    extends _$CreateUserResponseCopyWithImpl<$Res, _$CreateUserResponseImpl>
    implements _$$CreateUserResponseImplCopyWith<$Res> {
  __$$CreateUserResponseImplCopyWithImpl(_$CreateUserResponseImpl _value,
      $Res Function(_$CreateUserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? award = null,
  }) {
    return _then(_$CreateUserResponseImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Profile,
      award: null == award
          ? _value.award
          : award // ignore: cast_nullable_to_non_nullable
              as Award,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserResponseImpl implements _CreateUserResponse {
  const _$CreateUserResponseImpl({required this.user, required this.award});

  factory _$CreateUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserResponseImplFromJson(json);

  @override
  final Profile user;
  @override
  final Award award;

  @override
  String toString() {
    return 'CreateUserResponse(user: $user, award: $award)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.award, award) || other.award == award));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, award);

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserResponseImplCopyWith<_$CreateUserResponseImpl> get copyWith =>
      __$$CreateUserResponseImplCopyWithImpl<_$CreateUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateUserResponse implements CreateUserResponse {
  const factory _CreateUserResponse(
      {required final Profile user,
      required final Award award}) = _$CreateUserResponseImpl;

  factory _CreateUserResponse.fromJson(Map<String, dynamic> json) =
      _$CreateUserResponseImpl.fromJson;

  @override
  Profile get user;
  @override
  Award get award;

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserResponseImplCopyWith<_$CreateUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
