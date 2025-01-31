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
  String get imageName => throw _privateConstructorUsedError;
  bool? get isRegeneration => throw _privateConstructorUsedError;

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
  $Res call(
      {String objectOnImage,
      String imageUrl,
      String imageName,
      bool? isRegeneration});
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
    Object? imageName = null,
    Object? isRegeneration = freezed,
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
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      isRegeneration: freezed == isRegeneration
          ? _value.isRegeneration
          : isRegeneration // ignore: cast_nullable_to_non_nullable
              as bool?,
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
  $Res call(
      {String objectOnImage,
      String imageUrl,
      String imageName,
      bool? isRegeneration});
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
    Object? imageName = null,
    Object? isRegeneration = freezed,
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
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      isRegeneration: freezed == isRegeneration
          ? _value.isRegeneration
          : isRegeneration // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlashcardDTOImpl implements _CreateFlashcardDTO {
  const _$CreateFlashcardDTOImpl(
      {required this.objectOnImage,
      required this.imageUrl,
      required this.imageName,
      this.isRegeneration});

  factory _$CreateFlashcardDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFlashcardDTOImplFromJson(json);

  @override
  final String objectOnImage;
  @override
  final String imageUrl;
  @override
  final String imageName;
  @override
  final bool? isRegeneration;

  @override
  String toString() {
    return 'CreateFlashcardDTO(objectOnImage: $objectOnImage, imageUrl: $imageUrl, imageName: $imageName, isRegeneration: $isRegeneration)';
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
            (identical(other.imageName, imageName) ||
                other.imageName == imageName) &&
            (identical(other.isRegeneration, isRegeneration) ||
                other.isRegeneration == isRegeneration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, objectOnImage, imageUrl, imageName, isRegeneration);

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
      required final String imageName,
      final bool? isRegeneration}) = _$CreateFlashcardDTOImpl;

  factory _CreateFlashcardDTO.fromJson(Map<String, dynamic> json) =
      _$CreateFlashcardDTOImpl.fromJson;

  @override
  String get objectOnImage;
  @override
  String get imageUrl;
  @override
  String get imageName;
  @override
  bool? get isRegeneration;

  /// Create a copy of CreateFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlashcardDTOImplCopyWith<_$CreateFlashcardDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DislikeFlashcardDTO _$DislikeFlashcardDTOFromJson(Map<String, dynamic> json) {
  return _DislikeFlashcardDTO.fromJson(json);
}

/// @nodoc
mixin _$DislikeFlashcardDTO {
  String get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<String>? get categories => throw _privateConstructorUsedError;

  /// Serializes this DislikeFlashcardDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DislikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DislikeFlashcardDTOCopyWith<DislikeFlashcardDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DislikeFlashcardDTOCopyWith<$Res> {
  factory $DislikeFlashcardDTOCopyWith(
          DislikeFlashcardDTO value, $Res Function(DislikeFlashcardDTO) then) =
      _$DislikeFlashcardDTOCopyWithImpl<$Res, DislikeFlashcardDTO>;
  @useResult
  $Res call({String id, String? text, List<String>? categories});
}

/// @nodoc
class _$DislikeFlashcardDTOCopyWithImpl<$Res, $Val extends DislikeFlashcardDTO>
    implements $DislikeFlashcardDTOCopyWith<$Res> {
  _$DislikeFlashcardDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DislikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DislikeFlashcardDTOImplCopyWith<$Res>
    implements $DislikeFlashcardDTOCopyWith<$Res> {
  factory _$$DislikeFlashcardDTOImplCopyWith(_$DislikeFlashcardDTOImpl value,
          $Res Function(_$DislikeFlashcardDTOImpl) then) =
      __$$DislikeFlashcardDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? text, List<String>? categories});
}

/// @nodoc
class __$$DislikeFlashcardDTOImplCopyWithImpl<$Res>
    extends _$DislikeFlashcardDTOCopyWithImpl<$Res, _$DislikeFlashcardDTOImpl>
    implements _$$DislikeFlashcardDTOImplCopyWith<$Res> {
  __$$DislikeFlashcardDTOImplCopyWithImpl(_$DislikeFlashcardDTOImpl _value,
      $Res Function(_$DislikeFlashcardDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DislikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$DislikeFlashcardDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DislikeFlashcardDTOImpl implements _DislikeFlashcardDTO {
  const _$DislikeFlashcardDTOImpl(
      {required this.id, this.text, final List<String>? categories})
      : _categories = categories;

  factory _$DislikeFlashcardDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DislikeFlashcardDTOImplFromJson(json);

  @override
  final String id;
  @override
  final String? text;
  final List<String>? _categories;
  @override
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DislikeFlashcardDTO(id: $id, text: $text, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DislikeFlashcardDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, text, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of DislikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DislikeFlashcardDTOImplCopyWith<_$DislikeFlashcardDTOImpl> get copyWith =>
      __$$DislikeFlashcardDTOImplCopyWithImpl<_$DislikeFlashcardDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DislikeFlashcardDTOImplToJson(
      this,
    );
  }
}

abstract class _DislikeFlashcardDTO implements DislikeFlashcardDTO {
  const factory _DislikeFlashcardDTO(
      {required final String id,
      final String? text,
      final List<String>? categories}) = _$DislikeFlashcardDTOImpl;

  factory _DislikeFlashcardDTO.fromJson(Map<String, dynamic> json) =
      _$DislikeFlashcardDTOImpl.fromJson;

  @override
  String get id;
  @override
  String? get text;
  @override
  List<String>? get categories;

  /// Create a copy of DislikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DislikeFlashcardDTOImplCopyWith<_$DislikeFlashcardDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LikeFlashcardDTO _$LikeFlashcardDTOFromJson(Map<String, dynamic> json) {
  return _LikeFlashcardDTO.fromJson(json);
}

/// @nodoc
mixin _$LikeFlashcardDTO {
  String get cardId => throw _privateConstructorUsedError;
  bool get isAppropriate => throw _privateConstructorUsedError;

  /// Serializes this LikeFlashcardDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LikeFlashcardDTOCopyWith<LikeFlashcardDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeFlashcardDTOCopyWith<$Res> {
  factory $LikeFlashcardDTOCopyWith(
          LikeFlashcardDTO value, $Res Function(LikeFlashcardDTO) then) =
      _$LikeFlashcardDTOCopyWithImpl<$Res, LikeFlashcardDTO>;
  @useResult
  $Res call({String cardId, bool isAppropriate});
}

/// @nodoc
class _$LikeFlashcardDTOCopyWithImpl<$Res, $Val extends LikeFlashcardDTO>
    implements $LikeFlashcardDTOCopyWith<$Res> {
  _$LikeFlashcardDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? isAppropriate = null,
  }) {
    return _then(_value.copyWith(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      isAppropriate: null == isAppropriate
          ? _value.isAppropriate
          : isAppropriate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeFlashcardDTOImplCopyWith<$Res>
    implements $LikeFlashcardDTOCopyWith<$Res> {
  factory _$$LikeFlashcardDTOImplCopyWith(_$LikeFlashcardDTOImpl value,
          $Res Function(_$LikeFlashcardDTOImpl) then) =
      __$$LikeFlashcardDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cardId, bool isAppropriate});
}

/// @nodoc
class __$$LikeFlashcardDTOImplCopyWithImpl<$Res>
    extends _$LikeFlashcardDTOCopyWithImpl<$Res, _$LikeFlashcardDTOImpl>
    implements _$$LikeFlashcardDTOImplCopyWith<$Res> {
  __$$LikeFlashcardDTOImplCopyWithImpl(_$LikeFlashcardDTOImpl _value,
      $Res Function(_$LikeFlashcardDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of LikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? isAppropriate = null,
  }) {
    return _then(_$LikeFlashcardDTOImpl(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      isAppropriate: null == isAppropriate
          ? _value.isAppropriate
          : isAppropriate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikeFlashcardDTOImpl implements _LikeFlashcardDTO {
  const _$LikeFlashcardDTOImpl(
      {required this.cardId, required this.isAppropriate});

  factory _$LikeFlashcardDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikeFlashcardDTOImplFromJson(json);

  @override
  final String cardId;
  @override
  final bool isAppropriate;

  @override
  String toString() {
    return 'LikeFlashcardDTO(cardId: $cardId, isAppropriate: $isAppropriate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeFlashcardDTOImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.isAppropriate, isAppropriate) ||
                other.isAppropriate == isAppropriate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardId, isAppropriate);

  /// Create a copy of LikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeFlashcardDTOImplCopyWith<_$LikeFlashcardDTOImpl> get copyWith =>
      __$$LikeFlashcardDTOImplCopyWithImpl<_$LikeFlashcardDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikeFlashcardDTOImplToJson(
      this,
    );
  }
}

abstract class _LikeFlashcardDTO implements LikeFlashcardDTO {
  const factory _LikeFlashcardDTO(
      {required final String cardId,
      required final bool isAppropriate}) = _$LikeFlashcardDTOImpl;

  factory _LikeFlashcardDTO.fromJson(Map<String, dynamic> json) =
      _$LikeFlashcardDTOImpl.fromJson;

  @override
  String get cardId;
  @override
  bool get isAppropriate;

  /// Create a copy of LikeFlashcardDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeFlashcardDTOImplCopyWith<_$LikeFlashcardDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
