// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrganizeFlashcardDTO _$OrganizeFlashcardDTOFromJson(Map<String, dynamic> json) {
  return _OrganizeFlashcardDTO.fromJson(json);
}

/// @nodoc
mixin _$OrganizeFlashcardDTO {
  String get setId => throw _privateConstructorUsedError;
  List<String> get flashcardIds => throw _privateConstructorUsedError;

  /// Serializes this OrganizeFlashcardDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrganizeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganizeFlashcardDTOCopyWith<OrganizeFlashcardDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizeFlashcardDTOCopyWith<$Res> {
  factory $OrganizeFlashcardDTOCopyWith(OrganizeFlashcardDTO value,
          $Res Function(OrganizeFlashcardDTO) then) =
      _$OrganizeFlashcardDTOCopyWithImpl<$Res, OrganizeFlashcardDTO>;
  @useResult
  $Res call({String setId, List<String> flashcardIds});
}

/// @nodoc
class _$OrganizeFlashcardDTOCopyWithImpl<$Res,
        $Val extends OrganizeFlashcardDTO>
    implements $OrganizeFlashcardDTOCopyWith<$Res> {
  _$OrganizeFlashcardDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganizeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setId = null,
    Object? flashcardIds = null,
  }) {
    return _then(_value.copyWith(
      setId: null == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardIds: null == flashcardIds
          ? _value.flashcardIds
          : flashcardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganizeFlashcardDTOImplCopyWith<$Res>
    implements $OrganizeFlashcardDTOCopyWith<$Res> {
  factory _$$OrganizeFlashcardDTOImplCopyWith(_$OrganizeFlashcardDTOImpl value,
          $Res Function(_$OrganizeFlashcardDTOImpl) then) =
      __$$OrganizeFlashcardDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String setId, List<String> flashcardIds});
}

/// @nodoc
class __$$OrganizeFlashcardDTOImplCopyWithImpl<$Res>
    extends _$OrganizeFlashcardDTOCopyWithImpl<$Res, _$OrganizeFlashcardDTOImpl>
    implements _$$OrganizeFlashcardDTOImplCopyWith<$Res> {
  __$$OrganizeFlashcardDTOImplCopyWithImpl(_$OrganizeFlashcardDTOImpl _value,
      $Res Function(_$OrganizeFlashcardDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setId = null,
    Object? flashcardIds = null,
  }) {
    return _then(_$OrganizeFlashcardDTOImpl(
      setId: null == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardIds: null == flashcardIds
          ? _value._flashcardIds
          : flashcardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganizeFlashcardDTOImpl implements _OrganizeFlashcardDTO {
  const _$OrganizeFlashcardDTOImpl(
      {required this.setId, required final List<String> flashcardIds})
      : _flashcardIds = flashcardIds;

  factory _$OrganizeFlashcardDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizeFlashcardDTOImplFromJson(json);

  @override
  final String setId;
  final List<String> _flashcardIds;
  @override
  List<String> get flashcardIds {
    if (_flashcardIds is EqualUnmodifiableListView) return _flashcardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flashcardIds);
  }

  @override
  String toString() {
    return 'OrganizeFlashcardDTO(setId: $setId, flashcardIds: $flashcardIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizeFlashcardDTOImpl &&
            (identical(other.setId, setId) || other.setId == setId) &&
            const DeepCollectionEquality()
                .equals(other._flashcardIds, _flashcardIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, setId, const DeepCollectionEquality().hash(_flashcardIds));

  /// Create a copy of OrganizeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizeFlashcardDTOImplCopyWith<_$OrganizeFlashcardDTOImpl>
      get copyWith =>
          __$$OrganizeFlashcardDTOImplCopyWithImpl<_$OrganizeFlashcardDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizeFlashcardDTOImplToJson(
      this,
    );
  }
}

abstract class _OrganizeFlashcardDTO implements OrganizeFlashcardDTO {
  const factory _OrganizeFlashcardDTO(
      {required final String setId,
      required final List<String> flashcardIds}) = _$OrganizeFlashcardDTOImpl;

  factory _OrganizeFlashcardDTO.fromJson(Map<String, dynamic> json) =
      _$OrganizeFlashcardDTOImpl.fromJson;

  @override
  String get setId;
  @override
  List<String> get flashcardIds;

  /// Create a copy of OrganizeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizeFlashcardDTOImplCopyWith<_$OrganizeFlashcardDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FindAllFlashcardsDTO {
  Pagination get pagination => throw _privateConstructorUsedError;
  String? get setId => throw _privateConstructorUsedError;

  /// Create a copy of FindAllFlashcardsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindAllFlashcardsDTOCopyWith<FindAllFlashcardsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllFlashcardsDTOCopyWith<$Res> {
  factory $FindAllFlashcardsDTOCopyWith(FindAllFlashcardsDTO value,
          $Res Function(FindAllFlashcardsDTO) then) =
      _$FindAllFlashcardsDTOCopyWithImpl<$Res, FindAllFlashcardsDTO>;
  @useResult
  $Res call({Pagination pagination, String? setId});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$FindAllFlashcardsDTOCopyWithImpl<$Res,
        $Val extends FindAllFlashcardsDTO>
    implements $FindAllFlashcardsDTOCopyWith<$Res> {
  _$FindAllFlashcardsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindAllFlashcardsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? setId = freezed,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      setId: freezed == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of FindAllFlashcardsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FindAllFlashcardsDTOImplCopyWith<$Res>
    implements $FindAllFlashcardsDTOCopyWith<$Res> {
  factory _$$FindAllFlashcardsDTOImplCopyWith(_$FindAllFlashcardsDTOImpl value,
          $Res Function(_$FindAllFlashcardsDTOImpl) then) =
      __$$FindAllFlashcardsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pagination pagination, String? setId});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$FindAllFlashcardsDTOImplCopyWithImpl<$Res>
    extends _$FindAllFlashcardsDTOCopyWithImpl<$Res, _$FindAllFlashcardsDTOImpl>
    implements _$$FindAllFlashcardsDTOImplCopyWith<$Res> {
  __$$FindAllFlashcardsDTOImplCopyWithImpl(_$FindAllFlashcardsDTOImpl _value,
      $Res Function(_$FindAllFlashcardsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindAllFlashcardsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? setId = freezed,
  }) {
    return _then(_$FindAllFlashcardsDTOImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      setId: freezed == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FindAllFlashcardsDTOImpl implements _FindAllFlashcardsDTO {
  const _$FindAllFlashcardsDTOImpl({required this.pagination, this.setId});

  @override
  final Pagination pagination;
  @override
  final String? setId;

  @override
  String toString() {
    return 'FindAllFlashcardsDTO(pagination: $pagination, setId: $setId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllFlashcardsDTOImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.setId, setId) || other.setId == setId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pagination, setId);

  /// Create a copy of FindAllFlashcardsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllFlashcardsDTOImplCopyWith<_$FindAllFlashcardsDTOImpl>
      get copyWith =>
          __$$FindAllFlashcardsDTOImplCopyWithImpl<_$FindAllFlashcardsDTOImpl>(
              this, _$identity);
}

abstract class _FindAllFlashcardsDTO implements FindAllFlashcardsDTO {
  const factory _FindAllFlashcardsDTO(
      {required final Pagination pagination,
      final String? setId}) = _$FindAllFlashcardsDTOImpl;

  @override
  Pagination get pagination;
  @override
  String? get setId;

  /// Create a copy of FindAllFlashcardsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindAllFlashcardsDTOImplCopyWith<_$FindAllFlashcardsDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateFlashcardDTO _$CreateFlashcardDTOFromJson(Map<String, dynamic> json) {
  return _CreateFlashcardDTO.fromJson(json);
}

/// @nodoc
mixin _$CreateFlashcardDTO {
  String get objectOnImage => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get generatedImageName => throw _privateConstructorUsedError;

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
  $Res call({String objectOnImage, String imageUrl, String generatedImageName});
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
    Object? imageUrl = null,
    Object? generatedImageName = null,
  }) {
    return _then(_value.copyWith(
      objectOnImage: null == objectOnImage
          ? _value.objectOnImage
          : objectOnImage // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      generatedImageName: null == generatedImageName
          ? _value.generatedImageName
          : generatedImageName // ignore: cast_nullable_to_non_nullable
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
  $Res call({String objectOnImage, String imageUrl, String generatedImageName});
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
    Object? imageUrl = null,
    Object? generatedImageName = null,
  }) {
    return _then(_$CreateFlashcardDTOImpl(
      objectOnImage: null == objectOnImage
          ? _value.objectOnImage
          : objectOnImage // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      generatedImageName: null == generatedImageName
          ? _value.generatedImageName
          : generatedImageName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlashcardDTOImpl implements _CreateFlashcardDTO {
  const _$CreateFlashcardDTOImpl(
      {required this.objectOnImage,
      required this.imageUrl,
      required this.generatedImageName});

  factory _$CreateFlashcardDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFlashcardDTOImplFromJson(json);

  @override
  final String objectOnImage;
  @override
  final String imageUrl;
  @override
  final String generatedImageName;

  @override
  String toString() {
    return 'CreateFlashcardDTO(objectOnImage: $objectOnImage, imageUrl: $imageUrl, generatedImageName: $generatedImageName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlashcardDTOImpl &&
            (identical(other.objectOnImage, objectOnImage) ||
                other.objectOnImage == objectOnImage) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.generatedImageName, generatedImageName) ||
                other.generatedImageName == generatedImageName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, objectOnImage, imageUrl, generatedImageName);

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
      required final String imageUrl,
      required final String generatedImageName}) = _$CreateFlashcardDTOImpl;

  factory _CreateFlashcardDTO.fromJson(Map<String, dynamic> json) =
      _$CreateFlashcardDTOImpl.fromJson;

  @override
  String get objectOnImage;
  @override
  String get imageUrl;
  @override
  String get generatedImageName;

  /// Create a copy of CreateFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlashcardDTOImplCopyWith<_$CreateFlashcardDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
