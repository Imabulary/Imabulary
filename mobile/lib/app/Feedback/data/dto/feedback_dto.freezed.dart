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

CreateFeedbackDTO _$CreateFeedbackDTOFromJson(Map<String, dynamic> json) {
  return _CreateFeedbackDTO.fromJson(json);
}

/// @nodoc
mixin _$CreateFeedbackDTO {
  String get text => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this CreateFeedbackDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateFeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateFeedbackDTOCopyWith<CreateFeedbackDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFeedbackDTOCopyWith<$Res> {
  factory $CreateFeedbackDTOCopyWith(
          CreateFeedbackDTO value, $Res Function(CreateFeedbackDTO) then) =
      _$CreateFeedbackDTOCopyWithImpl<$Res, CreateFeedbackDTO>;
  @useResult
  $Res call({String text, Map<String, dynamic> metadata});
}

/// @nodoc
class _$CreateFeedbackDTOCopyWithImpl<$Res, $Val extends CreateFeedbackDTO>
    implements $CreateFeedbackDTOCopyWith<$Res> {
  _$CreateFeedbackDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateFeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateFeedbackDTOImplCopyWith<$Res>
    implements $CreateFeedbackDTOCopyWith<$Res> {
  factory _$$CreateFeedbackDTOImplCopyWith(_$CreateFeedbackDTOImpl value,
          $Res Function(_$CreateFeedbackDTOImpl) then) =
      __$$CreateFeedbackDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, Map<String, dynamic> metadata});
}

/// @nodoc
class __$$CreateFeedbackDTOImplCopyWithImpl<$Res>
    extends _$CreateFeedbackDTOCopyWithImpl<$Res, _$CreateFeedbackDTOImpl>
    implements _$$CreateFeedbackDTOImplCopyWith<$Res> {
  __$$CreateFeedbackDTOImplCopyWithImpl(_$CreateFeedbackDTOImpl _value,
      $Res Function(_$CreateFeedbackDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? metadata = null,
  }) {
    return _then(_$CreateFeedbackDTOImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFeedbackDTOImpl implements _CreateFeedbackDTO {
  const _$CreateFeedbackDTOImpl(
      {required this.text, required final Map<String, dynamic> metadata})
      : _metadata = metadata;

  factory _$CreateFeedbackDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFeedbackDTOImplFromJson(json);

  @override
  final String text;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'CreateFeedbackDTO(text: $text, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFeedbackDTOImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, text, const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of CreateFeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFeedbackDTOImplCopyWith<_$CreateFeedbackDTOImpl> get copyWith =>
      __$$CreateFeedbackDTOImplCopyWithImpl<_$CreateFeedbackDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFeedbackDTOImplToJson(
      this,
    );
  }
}

abstract class _CreateFeedbackDTO implements CreateFeedbackDTO {
  const factory _CreateFeedbackDTO(
      {required final String text,
      required final Map<String, dynamic> metadata}) = _$CreateFeedbackDTOImpl;

  factory _CreateFeedbackDTO.fromJson(Map<String, dynamic> json) =
      _$CreateFeedbackDTOImpl.fromJson;

  @override
  String get text;
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of CreateFeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFeedbackDTOImplCopyWith<_$CreateFeedbackDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
