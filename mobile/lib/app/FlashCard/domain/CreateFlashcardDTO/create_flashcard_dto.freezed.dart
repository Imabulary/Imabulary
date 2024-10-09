// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_flashcard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateFlashcardDTO _$CreateFlashcardDTOFromJson(Map<String, dynamic> json) {
  return _CreateFlashcardDTO.fromJson(json);
}

/// @nodoc
mixin _$CreateFlashcardDTO {
  String get objectOnImage => throw _privateConstructorUsedError;
  String get imageName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this CreateFlashcardDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateFlashcardDTOCopyWith<CreateFlashcardDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFlashcardDTOCopyWith<$Res> {
  factory $CreateFlashcardDTOCopyWith(
          CreateFlashcardDTO value, $Res Function(CreateFlashcardDTO) then) =
      _$CreateFlashcardDTOCopyWithImpl<$Res, CreateFlashcardDTO>;
  @useResult
  $Res call({String objectOnImage, String imageName, String imageUrl});
}

/// @nodoc
class _$CreateFlashcardDTOCopyWithImpl<$Res, $Val extends CreateFlashcardDTO>
    implements $CreateFlashcardDTOCopyWith<$Res> {
  _$CreateFlashcardDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectOnImage = null,
    Object? imageName = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      objectOnImage: null == objectOnImage
          ? _value.objectOnImage
          : objectOnImage // ignore: cast_nullable_to_non_nullable
              as String,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateFlashcardDTOImplCopyWith<$Res>
    implements $CreateFlashcardDTOCopyWith<$Res> {
  factory _$$CreateFlashcardDTOImplCopyWith(_$CreateFlashcardDTOImpl value,
          $Res Function(_$CreateFlashcardDTOImpl) then) =
      __$$CreateFlashcardDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String objectOnImage, String imageName, String imageUrl});
}

/// @nodoc
class __$$CreateFlashcardDTOImplCopyWithImpl<$Res>
    extends _$CreateFlashcardDTOCopyWithImpl<$Res, _$CreateFlashcardDTOImpl>
    implements _$$CreateFlashcardDTOImplCopyWith<$Res> {
  __$$CreateFlashcardDTOImplCopyWithImpl(_$CreateFlashcardDTOImpl _value,
      $Res Function(_$CreateFlashcardDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectOnImage = null,
    Object? imageName = null,
    Object? imageUrl = null,
  }) {
    return _then(_$CreateFlashcardDTOImpl(
      objectOnImage: null == objectOnImage
          ? _value.objectOnImage
          : objectOnImage // ignore: cast_nullable_to_non_nullable
              as String,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlashcardDTOImpl implements _CreateFlashcardDTO {
  const _$CreateFlashcardDTOImpl(
      {required this.objectOnImage,
      required this.imageName,
      required this.imageUrl});

  factory _$CreateFlashcardDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFlashcardDTOImplFromJson(json);

  @override
  final String objectOnImage;
  @override
  final String imageName;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'CreateFlashcardDTO(objectOnImage: $objectOnImage, imageName: $imageName, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlashcardDTOImpl &&
            (identical(other.objectOnImage, objectOnImage) ||
                other.objectOnImage == objectOnImage) &&
            (identical(other.imageName, imageName) ||
                other.imageName == imageName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, objectOnImage, imageName, imageUrl);

  /// Create a copy of CreateFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlashcardDTOImplCopyWith<_$CreateFlashcardDTOImpl> get copyWith =>
      __$$CreateFlashcardDTOImplCopyWithImpl<_$CreateFlashcardDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlashcardDTOImplToJson(
      this,
    );
  }
}

abstract class _CreateFlashcardDTO implements CreateFlashcardDTO {
  const factory _CreateFlashcardDTO(
      {required final String objectOnImage,
      required final String imageName,
      required final String imageUrl}) = _$CreateFlashcardDTOImpl;

  factory _CreateFlashcardDTO.fromJson(Map<String, dynamic> json) =
      _$CreateFlashcardDTOImpl.fromJson;

  @override
  String get objectOnImage;
  @override
  String get imageName;
  @override
  String get imageUrl;

  /// Create a copy of CreateFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlashcardDTOImplCopyWith<_$CreateFlashcardDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
