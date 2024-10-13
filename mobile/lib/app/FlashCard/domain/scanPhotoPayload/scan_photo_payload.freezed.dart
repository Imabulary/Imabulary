// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_photo_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScanPhotoPayload _$ScanPhotoPayloadFromJson(Map<String, dynamic> json) {
  return _ScanPhotoPayload.fromJson(json);
}

/// @nodoc
mixin _$ScanPhotoPayload {
  List<Map<String, dynamic>> get objectsOnImage =>
      throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get imageName => throw _privateConstructorUsedError;

  /// Serializes this ScanPhotoPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScanPhotoPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScanPhotoPayloadCopyWith<ScanPhotoPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanPhotoPayloadCopyWith<$Res> {
  factory $ScanPhotoPayloadCopyWith(
          ScanPhotoPayload value, $Res Function(ScanPhotoPayload) then) =
      _$ScanPhotoPayloadCopyWithImpl<$Res, ScanPhotoPayload>;
  @useResult
  $Res call(
      {List<Map<String, dynamic>> objectsOnImage,
      String imageUrl,
      String imageName});
}

/// @nodoc
class _$ScanPhotoPayloadCopyWithImpl<$Res, $Val extends ScanPhotoPayload>
    implements $ScanPhotoPayloadCopyWith<$Res> {
  _$ScanPhotoPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScanPhotoPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectsOnImage = null,
    Object? imageUrl = null,
    Object? imageName = null,
  }) {
    return _then(_value.copyWith(
      objectsOnImage: null == objectsOnImage
          ? _value.objectsOnImage
          : objectsOnImage // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanPhotoPayloadImplCopyWith<$Res>
    implements $ScanPhotoPayloadCopyWith<$Res> {
  factory _$$ScanPhotoPayloadImplCopyWith(_$ScanPhotoPayloadImpl value,
          $Res Function(_$ScanPhotoPayloadImpl) then) =
      __$$ScanPhotoPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Map<String, dynamic>> objectsOnImage,
      String imageUrl,
      String imageName});
}

/// @nodoc
class __$$ScanPhotoPayloadImplCopyWithImpl<$Res>
    extends _$ScanPhotoPayloadCopyWithImpl<$Res, _$ScanPhotoPayloadImpl>
    implements _$$ScanPhotoPayloadImplCopyWith<$Res> {
  __$$ScanPhotoPayloadImplCopyWithImpl(_$ScanPhotoPayloadImpl _value,
      $Res Function(_$ScanPhotoPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanPhotoPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectsOnImage = null,
    Object? imageUrl = null,
    Object? imageName = null,
  }) {
    return _then(_$ScanPhotoPayloadImpl(
      objectsOnImage: null == objectsOnImage
          ? _value._objectsOnImage
          : objectsOnImage // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanPhotoPayloadImpl
    with DiagnosticableTreeMixin
    implements _ScanPhotoPayload {
  const _$ScanPhotoPayloadImpl(
      {required final List<Map<String, dynamic>> objectsOnImage,
      required this.imageUrl,
      required this.imageName})
      : _objectsOnImage = objectsOnImage;

  factory _$ScanPhotoPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanPhotoPayloadImplFromJson(json);

  final List<Map<String, dynamic>> _objectsOnImage;
  @override
  List<Map<String, dynamic>> get objectsOnImage {
    if (_objectsOnImage is EqualUnmodifiableListView) return _objectsOnImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objectsOnImage);
  }

  @override
  final String imageUrl;
  @override
  final String imageName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScanPhotoPayload(objectsOnImage: $objectsOnImage, imageUrl: $imageUrl, imageName: $imageName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScanPhotoPayload'))
      ..add(DiagnosticsProperty('objectsOnImage', objectsOnImage))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('imageName', imageName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanPhotoPayloadImpl &&
            const DeepCollectionEquality()
                .equals(other._objectsOnImage, _objectsOnImage) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageName, imageName) ||
                other.imageName == imageName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_objectsOnImage),
      imageUrl,
      imageName);

  /// Create a copy of ScanPhotoPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanPhotoPayloadImplCopyWith<_$ScanPhotoPayloadImpl> get copyWith =>
      __$$ScanPhotoPayloadImplCopyWithImpl<_$ScanPhotoPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanPhotoPayloadImplToJson(
      this,
    );
  }
}

abstract class _ScanPhotoPayload implements ScanPhotoPayload {
  const factory _ScanPhotoPayload(
      {required final List<Map<String, dynamic>> objectsOnImage,
      required final String imageUrl,
      required final String imageName}) = _$ScanPhotoPayloadImpl;

  factory _ScanPhotoPayload.fromJson(Map<String, dynamic> json) =
      _$ScanPhotoPayloadImpl.fromJson;

  @override
  List<Map<String, dynamic>> get objectsOnImage;
  @override
  String get imageUrl;
  @override
  String get imageName;

  /// Create a copy of ScanPhotoPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanPhotoPayloadImplCopyWith<_$ScanPhotoPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
