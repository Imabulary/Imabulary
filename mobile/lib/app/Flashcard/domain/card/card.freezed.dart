// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlashCard _$FlashCardFromJson(Map<String, dynamic> json) {
  return _FlashCard.fromJson(json);
}

/// @nodoc
mixin _$FlashCard {
  String get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get phrase => throw _privateConstructorUsedError;
  String get translated_phrase => throw _privateConstructorUsedError;
  String get translated_word => throw _privateConstructorUsedError;
  String get target_language => throw _privateConstructorUsedError;
  String get source_language => throw _privateConstructorUsedError;
  String get image_url => throw _privateConstructorUsedError;
  bool get is_regenerated => throw _privateConstructorUsedError;
  String? get speech_part => throw _privateConstructorUsedError;
  String? get translated_explanation => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  String? get image_name => throw _privateConstructorUsedError;
  String? get audio_url => throw _privateConstructorUsedError;
  String? get audio_name => throw _privateConstructorUsedError;
  ServerEnum? get QuizStatus => throw _privateConstructorUsedError;

  /// Serializes this FlashCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashCardCopyWith<FlashCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashCardCopyWith<$Res> {
  factory $FlashCardCopyWith(FlashCard value, $Res Function(FlashCard) then) =
      _$FlashCardCopyWithImpl<$Res, FlashCard>;
  @useResult
  $Res call(
      {String id,
      String word,
      String phrase,
      String translated_phrase,
      String translated_word,
      String target_language,
      String source_language,
      String image_url,
      bool is_regenerated,
      String? speech_part,
      String? translated_explanation,
      String? explanation,
      String? image_name,
      String? audio_url,
      String? audio_name,
      ServerEnum? QuizStatus});

  $ServerEnumCopyWith<$Res>? get QuizStatus;
}

/// @nodoc
class _$FlashCardCopyWithImpl<$Res, $Val extends FlashCard>
    implements $FlashCardCopyWith<$Res> {
  _$FlashCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? phrase = null,
    Object? translated_phrase = null,
    Object? translated_word = null,
    Object? target_language = null,
    Object? source_language = null,
    Object? image_url = null,
    Object? is_regenerated = null,
    Object? speech_part = freezed,
    Object? translated_explanation = freezed,
    Object? explanation = freezed,
    Object? image_name = freezed,
    Object? audio_url = freezed,
    Object? audio_name = freezed,
    Object? QuizStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      phrase: null == phrase
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      translated_phrase: null == translated_phrase
          ? _value.translated_phrase
          : translated_phrase // ignore: cast_nullable_to_non_nullable
              as String,
      translated_word: null == translated_word
          ? _value.translated_word
          : translated_word // ignore: cast_nullable_to_non_nullable
              as String,
      target_language: null == target_language
          ? _value.target_language
          : target_language // ignore: cast_nullable_to_non_nullable
              as String,
      source_language: null == source_language
          ? _value.source_language
          : source_language // ignore: cast_nullable_to_non_nullable
              as String,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      is_regenerated: null == is_regenerated
          ? _value.is_regenerated
          : is_regenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      speech_part: freezed == speech_part
          ? _value.speech_part
          : speech_part // ignore: cast_nullable_to_non_nullable
              as String?,
      translated_explanation: freezed == translated_explanation
          ? _value.translated_explanation
          : translated_explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      image_name: freezed == image_name
          ? _value.image_name
          : image_name // ignore: cast_nullable_to_non_nullable
              as String?,
      audio_url: freezed == audio_url
          ? _value.audio_url
          : audio_url // ignore: cast_nullable_to_non_nullable
              as String?,
      audio_name: freezed == audio_name
          ? _value.audio_name
          : audio_name // ignore: cast_nullable_to_non_nullable
              as String?,
      QuizStatus: freezed == QuizStatus
          ? _value.QuizStatus
          : QuizStatus // ignore: cast_nullable_to_non_nullable
              as ServerEnum?,
    ) as $Val);
  }

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerEnumCopyWith<$Res>? get QuizStatus {
    if (_value.QuizStatus == null) {
      return null;
    }

    return $ServerEnumCopyWith<$Res>(_value.QuizStatus!, (value) {
      return _then(_value.copyWith(QuizStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlashCardImplCopyWith<$Res>
    implements $FlashCardCopyWith<$Res> {
  factory _$$FlashCardImplCopyWith(
          _$FlashCardImpl value, $Res Function(_$FlashCardImpl) then) =
      __$$FlashCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String word,
      String phrase,
      String translated_phrase,
      String translated_word,
      String target_language,
      String source_language,
      String image_url,
      bool is_regenerated,
      String? speech_part,
      String? translated_explanation,
      String? explanation,
      String? image_name,
      String? audio_url,
      String? audio_name,
      ServerEnum? QuizStatus});

  @override
  $ServerEnumCopyWith<$Res>? get QuizStatus;
}

/// @nodoc
class __$$FlashCardImplCopyWithImpl<$Res>
    extends _$FlashCardCopyWithImpl<$Res, _$FlashCardImpl>
    implements _$$FlashCardImplCopyWith<$Res> {
  __$$FlashCardImplCopyWithImpl(
      _$FlashCardImpl _value, $Res Function(_$FlashCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? phrase = null,
    Object? translated_phrase = null,
    Object? translated_word = null,
    Object? target_language = null,
    Object? source_language = null,
    Object? image_url = null,
    Object? is_regenerated = null,
    Object? speech_part = freezed,
    Object? translated_explanation = freezed,
    Object? explanation = freezed,
    Object? image_name = freezed,
    Object? audio_url = freezed,
    Object? audio_name = freezed,
    Object? QuizStatus = freezed,
  }) {
    return _then(_$FlashCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      phrase: null == phrase
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      translated_phrase: null == translated_phrase
          ? _value.translated_phrase
          : translated_phrase // ignore: cast_nullable_to_non_nullable
              as String,
      translated_word: null == translated_word
          ? _value.translated_word
          : translated_word // ignore: cast_nullable_to_non_nullable
              as String,
      target_language: null == target_language
          ? _value.target_language
          : target_language // ignore: cast_nullable_to_non_nullable
              as String,
      source_language: null == source_language
          ? _value.source_language
          : source_language // ignore: cast_nullable_to_non_nullable
              as String,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      is_regenerated: null == is_regenerated
          ? _value.is_regenerated
          : is_regenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      speech_part: freezed == speech_part
          ? _value.speech_part
          : speech_part // ignore: cast_nullable_to_non_nullable
              as String?,
      translated_explanation: freezed == translated_explanation
          ? _value.translated_explanation
          : translated_explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      image_name: freezed == image_name
          ? _value.image_name
          : image_name // ignore: cast_nullable_to_non_nullable
              as String?,
      audio_url: freezed == audio_url
          ? _value.audio_url
          : audio_url // ignore: cast_nullable_to_non_nullable
              as String?,
      audio_name: freezed == audio_name
          ? _value.audio_name
          : audio_name // ignore: cast_nullable_to_non_nullable
              as String?,
      QuizStatus: freezed == QuizStatus
          ? _value.QuizStatus
          : QuizStatus // ignore: cast_nullable_to_non_nullable
              as ServerEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlashCardImpl implements _FlashCard {
  const _$FlashCardImpl(
      {required this.id,
      required this.word,
      required this.phrase,
      required this.translated_phrase,
      required this.translated_word,
      required this.target_language,
      required this.source_language,
      required this.image_url,
      required this.is_regenerated,
      this.speech_part,
      this.translated_explanation,
      this.explanation,
      this.image_name,
      this.audio_url,
      this.audio_name,
      this.QuizStatus});

  factory _$FlashCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashCardImplFromJson(json);

  @override
  final String id;
  @override
  final String word;
  @override
  final String phrase;
  @override
  final String translated_phrase;
  @override
  final String translated_word;
  @override
  final String target_language;
  @override
  final String source_language;
  @override
  final String image_url;
  @override
  final bool is_regenerated;
  @override
  final String? speech_part;
  @override
  final String? translated_explanation;
  @override
  final String? explanation;
  @override
  final String? image_name;
  @override
  final String? audio_url;
  @override
  final String? audio_name;
  @override
  final ServerEnum? QuizStatus;

  @override
  String toString() {
    return 'FlashCard(id: $id, word: $word, phrase: $phrase, translated_phrase: $translated_phrase, translated_word: $translated_word, target_language: $target_language, source_language: $source_language, image_url: $image_url, is_regenerated: $is_regenerated, speech_part: $speech_part, translated_explanation: $translated_explanation, explanation: $explanation, image_name: $image_name, audio_url: $audio_url, audio_name: $audio_name, QuizStatus: $QuizStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.translated_phrase, translated_phrase) ||
                other.translated_phrase == translated_phrase) &&
            (identical(other.translated_word, translated_word) ||
                other.translated_word == translated_word) &&
            (identical(other.target_language, target_language) ||
                other.target_language == target_language) &&
            (identical(other.source_language, source_language) ||
                other.source_language == source_language) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.is_regenerated, is_regenerated) ||
                other.is_regenerated == is_regenerated) &&
            (identical(other.speech_part, speech_part) ||
                other.speech_part == speech_part) &&
            (identical(other.translated_explanation, translated_explanation) ||
                other.translated_explanation == translated_explanation) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.image_name, image_name) ||
                other.image_name == image_name) &&
            (identical(other.audio_url, audio_url) ||
                other.audio_url == audio_url) &&
            (identical(other.audio_name, audio_name) ||
                other.audio_name == audio_name) &&
            (identical(other.QuizStatus, QuizStatus) ||
                other.QuizStatus == QuizStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      word,
      phrase,
      translated_phrase,
      translated_word,
      target_language,
      source_language,
      image_url,
      is_regenerated,
      speech_part,
      translated_explanation,
      explanation,
      image_name,
      audio_url,
      audio_name,
      QuizStatus);

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashCardImplCopyWith<_$FlashCardImpl> get copyWith =>
      __$$FlashCardImplCopyWithImpl<_$FlashCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashCardImplToJson(
      this,
    );
  }
}

abstract class _FlashCard implements FlashCard {
  const factory _FlashCard(
      {required final String id,
      required final String word,
      required final String phrase,
      required final String translated_phrase,
      required final String translated_word,
      required final String target_language,
      required final String source_language,
      required final String image_url,
      required final bool is_regenerated,
      final String? speech_part,
      final String? translated_explanation,
      final String? explanation,
      final String? image_name,
      final String? audio_url,
      final String? audio_name,
      final ServerEnum? QuizStatus}) = _$FlashCardImpl;

  factory _FlashCard.fromJson(Map<String, dynamic> json) =
      _$FlashCardImpl.fromJson;

  @override
  String get id;
  @override
  String get word;
  @override
  String get phrase;
  @override
  String get translated_phrase;
  @override
  String get translated_word;
  @override
  String get target_language;
  @override
  String get source_language;
  @override
  String get image_url;
  @override
  bool get is_regenerated;
  @override
  String? get speech_part;
  @override
  String? get translated_explanation;
  @override
  String? get explanation;
  @override
  String? get image_name;
  @override
  String? get audio_url;
  @override
  String? get audio_name;
  @override
  ServerEnum? get QuizStatus;

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashCardImplCopyWith<_$FlashCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
