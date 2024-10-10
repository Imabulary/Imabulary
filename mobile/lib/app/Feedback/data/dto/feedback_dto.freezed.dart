// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateNoDiseredObjectDTO _$CreateNoDiseredObjectDTOFromJson(
    Map<String, dynamic> json) {
  return _CreateNoDiseredObjectDTO.fromJson(json);
}

/// @nodoc
mixin _$CreateNoDiseredObjectDTO {
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get objectsOnImage => throw _privateConstructorUsedError;

  /// Serializes this CreateNoDiseredObjectDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateNoDiseredObjectDTOCopyWith<CreateNoDiseredObjectDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNoDiseredObjectDTOCopyWith<$Res> {
  factory $CreateNoDiseredObjectDTOCopyWith(CreateNoDiseredObjectDTO value,
          $Res Function(CreateNoDiseredObjectDTO) then) =
      _$CreateNoDiseredObjectDTOCopyWithImpl<$Res, CreateNoDiseredObjectDTO>;
  @useResult
  $Res call({String imageUrl, List<String> objectsOnImage});
}

/// @nodoc
class _$CreateNoDiseredObjectDTOCopyWithImpl<$Res,
        $Val extends CreateNoDiseredObjectDTO>
    implements $CreateNoDiseredObjectDTOCopyWith<$Res> {
  _$CreateNoDiseredObjectDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? objectsOnImage = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      objectsOnImage: null == objectsOnImage
          ? _value.objectsOnImage
          : objectsOnImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateNoDiseredObjectDTOImplCopyWith<$Res>
    implements $CreateNoDiseredObjectDTOCopyWith<$Res> {
  factory _$$CreateNoDiseredObjectDTOImplCopyWith(
          _$CreateNoDiseredObjectDTOImpl value,
          $Res Function(_$CreateNoDiseredObjectDTOImpl) then) =
      __$$CreateNoDiseredObjectDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageUrl, List<String> objectsOnImage});
}

/// @nodoc
class __$$CreateNoDiseredObjectDTOImplCopyWithImpl<$Res>
    extends _$CreateNoDiseredObjectDTOCopyWithImpl<$Res,
        _$CreateNoDiseredObjectDTOImpl>
    implements _$$CreateNoDiseredObjectDTOImplCopyWith<$Res> {
  __$$CreateNoDiseredObjectDTOImplCopyWithImpl(
      _$CreateNoDiseredObjectDTOImpl _value,
      $Res Function(_$CreateNoDiseredObjectDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? objectsOnImage = null,
  }) {
    return _then(_$CreateNoDiseredObjectDTOImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      objectsOnImage: null == objectsOnImage
          ? _value._objectsOnImage
          : objectsOnImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateNoDiseredObjectDTOImpl implements _CreateNoDiseredObjectDTO {
  const _$CreateNoDiseredObjectDTOImpl(
      {required this.imageUrl, required final List<String> objectsOnImage})
      : _objectsOnImage = objectsOnImage;

  factory _$CreateNoDiseredObjectDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateNoDiseredObjectDTOImplFromJson(json);

  @override
  final String imageUrl;
  final List<String> _objectsOnImage;
  @override
  List<String> get objectsOnImage {
    if (_objectsOnImage is EqualUnmodifiableListView) return _objectsOnImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objectsOnImage);
  }

  @override
  String toString() {
    return 'CreateNoDiseredObjectDTO(imageUrl: $imageUrl, objectsOnImage: $objectsOnImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNoDiseredObjectDTOImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._objectsOnImage, _objectsOnImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl,
      const DeepCollectionEquality().hash(_objectsOnImage));

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNoDiseredObjectDTOImplCopyWith<_$CreateNoDiseredObjectDTOImpl>
      get copyWith => __$$CreateNoDiseredObjectDTOImplCopyWithImpl<
          _$CreateNoDiseredObjectDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateNoDiseredObjectDTOImplToJson(
      this,
    );
  }
}

abstract class _CreateNoDiseredObjectDTO implements CreateNoDiseredObjectDTO {
  const factory _CreateNoDiseredObjectDTO(
          {required final String imageUrl,
          required final List<String> objectsOnImage}) =
      _$CreateNoDiseredObjectDTOImpl;

  factory _CreateNoDiseredObjectDTO.fromJson(Map<String, dynamic> json) =
      _$CreateNoDiseredObjectDTOImpl.fromJson;

  @override
  String get imageUrl;
  @override
  List<String> get objectsOnImage;

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateNoDiseredObjectDTOImplCopyWith<_$CreateNoDiseredObjectDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
