// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
