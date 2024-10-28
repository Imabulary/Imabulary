// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return _Feedback.fromJson(json);
}

/// @nodoc
mixin _$Feedback {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get cardId => throw _privateConstructorUsedError;
  bool get isAppropriate => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this Feedback to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackCopyWith<Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackCopyWith<$Res> {
  factory $FeedbackCopyWith(Feedback value, $Res Function(Feedback) then) =
      _$FeedbackCopyWithImpl<$Res, Feedback>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String cardId,
      bool isAppropriate,
      String? text,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$FeedbackCopyWithImpl<$Res, $Val extends Feedback>
    implements $FeedbackCopyWith<$Res> {
  _$FeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? cardId = null,
    Object? isAppropriate = null,
    Object? text = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      isAppropriate: null == isAppropriate
          ? _value.isAppropriate
          : isAppropriate // ignore: cast_nullable_to_non_nullable
              as bool,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackImplCopyWith<$Res>
    implements $FeedbackCopyWith<$Res> {
  factory _$$FeedbackImplCopyWith(
          _$FeedbackImpl value, $Res Function(_$FeedbackImpl) then) =
      __$$FeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String cardId,
      bool isAppropriate,
      String? text,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$FeedbackImplCopyWithImpl<$Res>
    extends _$FeedbackCopyWithImpl<$Res, _$FeedbackImpl>
    implements _$$FeedbackImplCopyWith<$Res> {
  __$$FeedbackImplCopyWithImpl(
      _$FeedbackImpl _value, $Res Function(_$FeedbackImpl) _then)
      : super(_value, _then);

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? cardId = null,
    Object? isAppropriate = null,
    Object? text = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$FeedbackImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      isAppropriate: null == isAppropriate
          ? _value.isAppropriate
          : isAppropriate // ignore: cast_nullable_to_non_nullable
              as bool,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackImpl implements _Feedback {
  const _$FeedbackImpl(
      {required this.id,
      required this.userId,
      required this.cardId,
      required this.isAppropriate,
      this.text,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$FeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String cardId;
  @override
  final bool isAppropriate;
  @override
  final String? text;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Feedback(id: $id, userId: $userId, cardId: $cardId, isAppropriate: $isAppropriate, text: $text, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.isAppropriate, isAppropriate) ||
                other.isAppropriate == isAppropriate) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, cardId,
      isAppropriate, text, const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackImplCopyWith<_$FeedbackImpl> get copyWith =>
      __$$FeedbackImplCopyWithImpl<_$FeedbackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackImplToJson(
      this,
    );
  }
}

abstract class _Feedback implements Feedback {
  const factory _Feedback(
      {required final String id,
      required final String userId,
      required final String cardId,
      required final bool isAppropriate,
      final String? text,
      final Map<String, dynamic>? metadata}) = _$FeedbackImpl;

  factory _Feedback.fromJson(Map<String, dynamic> json) =
      _$FeedbackImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get cardId;
  @override
  bool get isAppropriate;
  @override
  String? get text;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackImplCopyWith<_$FeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedbackCategory _$FeedbackCategoryFromJson(Map<String, dynamic> json) {
  return _FeedbackCategory.fromJson(json);
}

/// @nodoc
mixin _$FeedbackCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get meaning => throw _privateConstructorUsedError;

  /// Serializes this FeedbackCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackCategoryCopyWith<FeedbackCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackCategoryCopyWith<$Res> {
  factory $FeedbackCategoryCopyWith(
          FeedbackCategory value, $Res Function(FeedbackCategory) then) =
      _$FeedbackCategoryCopyWithImpl<$Res, FeedbackCategory>;
  @useResult
  $Res call({String id, String name, String slug, String meaning});
}

/// @nodoc
class _$FeedbackCategoryCopyWithImpl<$Res, $Val extends FeedbackCategory>
    implements $FeedbackCategoryCopyWith<$Res> {
  _$FeedbackCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? meaning = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackCategoryImplCopyWith<$Res>
    implements $FeedbackCategoryCopyWith<$Res> {
  factory _$$FeedbackCategoryImplCopyWith(_$FeedbackCategoryImpl value,
          $Res Function(_$FeedbackCategoryImpl) then) =
      __$$FeedbackCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String slug, String meaning});
}

/// @nodoc
class __$$FeedbackCategoryImplCopyWithImpl<$Res>
    extends _$FeedbackCategoryCopyWithImpl<$Res, _$FeedbackCategoryImpl>
    implements _$$FeedbackCategoryImplCopyWith<$Res> {
  __$$FeedbackCategoryImplCopyWithImpl(_$FeedbackCategoryImpl _value,
      $Res Function(_$FeedbackCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? meaning = null,
  }) {
    return _then(_$FeedbackCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackCategoryImpl implements _FeedbackCategory {
  const _$FeedbackCategoryImpl(
      {required this.id,
      required this.name,
      required this.slug,
      required this.meaning});

  factory _$FeedbackCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String meaning;

  @override
  String toString() {
    return 'FeedbackCategory(id: $id, name: $name, slug: $slug, meaning: $meaning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.meaning, meaning) || other.meaning == meaning));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, meaning);

  /// Create a copy of FeedbackCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackCategoryImplCopyWith<_$FeedbackCategoryImpl> get copyWith =>
      __$$FeedbackCategoryImplCopyWithImpl<_$FeedbackCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackCategoryImplToJson(
      this,
    );
  }
}

abstract class _FeedbackCategory implements FeedbackCategory {
  const factory _FeedbackCategory(
      {required final String id,
      required final String name,
      required final String slug,
      required final String meaning}) = _$FeedbackCategoryImpl;

  factory _FeedbackCategory.fromJson(Map<String, dynamic> json) =
      _$FeedbackCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String get meaning;

  /// Create a copy of FeedbackCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackCategoryImplCopyWith<_$FeedbackCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
