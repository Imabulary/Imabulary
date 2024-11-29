// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_quiz_answer_DTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateQuizAnswerDTO _$UpdateQuizAnswerDTOFromJson(Map<String, dynamic> json) {
  return _UpdateQuizAnswerDTO.fromJson(json);
}

/// @nodoc
mixin _$UpdateQuizAnswerDTO {
  String get cardId => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;

  /// Serializes this UpdateQuizAnswerDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateQuizAnswerDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateQuizAnswerDTOCopyWith<UpdateQuizAnswerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateQuizAnswerDTOCopyWith<$Res> {
  factory $UpdateQuizAnswerDTOCopyWith(
          UpdateQuizAnswerDTO value, $Res Function(UpdateQuizAnswerDTO) then) =
      _$UpdateQuizAnswerDTOCopyWithImpl<$Res, UpdateQuizAnswerDTO>;
  @useResult
  $Res call({String cardId, String word});
}

/// @nodoc
class _$UpdateQuizAnswerDTOCopyWithImpl<$Res, $Val extends UpdateQuizAnswerDTO>
    implements $UpdateQuizAnswerDTOCopyWith<$Res> {
  _$UpdateQuizAnswerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateQuizAnswerDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? word = null,
  }) {
    return _then(_value.copyWith(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateQuizAnswerDTOImplCopyWith<$Res>
    implements $UpdateQuizAnswerDTOCopyWith<$Res> {
  factory _$$UpdateQuizAnswerDTOImplCopyWith(_$UpdateQuizAnswerDTOImpl value,
          $Res Function(_$UpdateQuizAnswerDTOImpl) then) =
      __$$UpdateQuizAnswerDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cardId, String word});
}

/// @nodoc
class __$$UpdateQuizAnswerDTOImplCopyWithImpl<$Res>
    extends _$UpdateQuizAnswerDTOCopyWithImpl<$Res, _$UpdateQuizAnswerDTOImpl>
    implements _$$UpdateQuizAnswerDTOImplCopyWith<$Res> {
  __$$UpdateQuizAnswerDTOImplCopyWithImpl(_$UpdateQuizAnswerDTOImpl _value,
      $Res Function(_$UpdateQuizAnswerDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateQuizAnswerDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? word = null,
  }) {
    return _then(_$UpdateQuizAnswerDTOImpl(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateQuizAnswerDTOImpl implements _UpdateQuizAnswerDTO {
  const _$UpdateQuizAnswerDTOImpl({required this.cardId, required this.word});

  factory _$UpdateQuizAnswerDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateQuizAnswerDTOImplFromJson(json);

  @override
  final String cardId;
  @override
  final String word;

  @override
  String toString() {
    return 'UpdateQuizAnswerDTO(cardId: $cardId, word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuizAnswerDTOImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.word, word) || other.word == word));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardId, word);

  /// Create a copy of UpdateQuizAnswerDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQuizAnswerDTOImplCopyWith<_$UpdateQuizAnswerDTOImpl> get copyWith =>
      __$$UpdateQuizAnswerDTOImplCopyWithImpl<_$UpdateQuizAnswerDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateQuizAnswerDTOImplToJson(
      this,
    );
  }
}

abstract class _UpdateQuizAnswerDTO implements UpdateQuizAnswerDTO {
  const factory _UpdateQuizAnswerDTO(
      {required final String cardId,
      required final String word}) = _$UpdateQuizAnswerDTOImpl;

  factory _UpdateQuizAnswerDTO.fromJson(Map<String, dynamic> json) =
      _$UpdateQuizAnswerDTOImpl.fromJson;

  @override
  String get cardId;
  @override
  String get word;

  /// Create a copy of UpdateQuizAnswerDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateQuizAnswerDTOImplCopyWith<_$UpdateQuizAnswerDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
