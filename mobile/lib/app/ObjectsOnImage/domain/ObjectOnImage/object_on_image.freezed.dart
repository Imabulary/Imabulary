// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'object_on_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ObjectOnImage _$ObjectOnImageFromJson(Map<String, dynamic> json) {
  return _ObjectOnImage.fromJson(json);
}

/// @nodoc
mixin _$ObjectOnImage {
  String get name => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String get translatedName => throw _privateConstructorUsedError;

  /// Serializes this ObjectOnImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ObjectOnImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ObjectOnImageCopyWith<ObjectOnImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectOnImageCopyWith<$Res> {
  factory $ObjectOnImageCopyWith(
          ObjectOnImage value, $Res Function(ObjectOnImage) then) =
      _$ObjectOnImageCopyWithImpl<$Res, ObjectOnImage>;
  @useResult
  $Res call({String name, double score, String translatedName});
}

/// @nodoc
class _$ObjectOnImageCopyWithImpl<$Res, $Val extends ObjectOnImage>
    implements $ObjectOnImageCopyWith<$Res> {
  _$ObjectOnImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ObjectOnImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? score = null,
    Object? translatedName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      translatedName: null == translatedName
          ? _value.translatedName
          : translatedName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObjectOnImageImplCopyWith<$Res>
    implements $ObjectOnImageCopyWith<$Res> {
  factory _$$ObjectOnImageImplCopyWith(
          _$ObjectOnImageImpl value, $Res Function(_$ObjectOnImageImpl) then) =
      __$$ObjectOnImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double score, String translatedName});
}

/// @nodoc
class __$$ObjectOnImageImplCopyWithImpl<$Res>
    extends _$ObjectOnImageCopyWithImpl<$Res, _$ObjectOnImageImpl>
    implements _$$ObjectOnImageImplCopyWith<$Res> {
  __$$ObjectOnImageImplCopyWithImpl(
      _$ObjectOnImageImpl _value, $Res Function(_$ObjectOnImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ObjectOnImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? score = null,
    Object? translatedName = null,
  }) {
    return _then(_$ObjectOnImageImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      translatedName: null == translatedName
          ? _value.translatedName
          : translatedName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObjectOnImageImpl
    with DiagnosticableTreeMixin
    implements _ObjectOnImage {
  const _$ObjectOnImageImpl(
      {required this.name, required this.score, required this.translatedName});

  factory _$ObjectOnImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObjectOnImageImplFromJson(json);

  @override
  final String name;
  @override
  final double score;
  @override
  final String translatedName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ObjectOnImage(name: $name, score: $score, translatedName: $translatedName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ObjectOnImage'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('translatedName', translatedName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObjectOnImageImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.translatedName, translatedName) ||
                other.translatedName == translatedName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, score, translatedName);

  /// Create a copy of ObjectOnImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ObjectOnImageImplCopyWith<_$ObjectOnImageImpl> get copyWith =>
      __$$ObjectOnImageImplCopyWithImpl<_$ObjectOnImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObjectOnImageImplToJson(
      this,
    );
  }
}

abstract class _ObjectOnImage implements ObjectOnImage {
  const factory _ObjectOnImage(
      {required final String name,
      required final double score,
      required final String translatedName}) = _$ObjectOnImageImpl;

  factory _ObjectOnImage.fromJson(Map<String, dynamic> json) =
      _$ObjectOnImageImpl.fromJson;

  @override
  String get name;
  @override
  double get score;
  @override
  String get translatedName;

  /// Create a copy of ObjectOnImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ObjectOnImageImplCopyWith<_$ObjectOnImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
