// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Set _$SetFromJson(Map<String, dynamic> json) {
  return _Set.fromJson(json);
}

/// @nodoc
mixin _$Set {
  String get id => throw _privateConstructorUsedError;
  @Assert('name.length <= $kMaxSetNameLength',
      'Name should not be more than $kMaxSetNameLength characters')
  String get name => throw _privateConstructorUsedError;
  @Assert('description.length <= $kMaxSetDescriptionLength',
      'Description should not be more than $kMaxSetDescriptionLength characters')
  String? get description => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;
  List<({String image_url, String quizStatusId})>? get flashcards =>
      throw _privateConstructorUsedError;

  /// Serializes this Set to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetCopyWith<Set> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetCopyWith<$Res> {
  factory $SetCopyWith(Set value, $Res Function(Set) then) =
      _$SetCopyWithImpl<$Res, Set>;
  @useResult
  $Res call(
      {String id,
      @Assert('name.length <= $kMaxSetNameLength',
          'Name should not be more than $kMaxSetNameLength characters')
      String name,
      @Assert('description.length <= $kMaxSetDescriptionLength',
          'Description should not be more than $kMaxSetDescriptionLength characters')
      String? description,
      String userId,
      DateTime createdAt,
      DateTime updatedAt,
      bool isFinished,
      List<({String image_url, String quizStatusId})>? flashcards});
}

/// @nodoc
class _$SetCopyWithImpl<$Res, $Val extends Set> implements $SetCopyWith<$Res> {
  _$SetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isFinished = null,
    Object? flashcards = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcards: freezed == flashcards
          ? _value.flashcards
          : flashcards // ignore: cast_nullable_to_non_nullable
              as List<({String image_url, String quizStatusId})>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetImplCopyWith<$Res> implements $SetCopyWith<$Res> {
  factory _$$SetImplCopyWith(_$SetImpl value, $Res Function(_$SetImpl) then) =
      __$$SetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @Assert('name.length <= $kMaxSetNameLength',
          'Name should not be more than $kMaxSetNameLength characters')
      String name,
      @Assert('description.length <= $kMaxSetDescriptionLength',
          'Description should not be more than $kMaxSetDescriptionLength characters')
      String? description,
      String userId,
      DateTime createdAt,
      DateTime updatedAt,
      bool isFinished,
      List<({String image_url, String quizStatusId})>? flashcards});
}

/// @nodoc
class __$$SetImplCopyWithImpl<$Res> extends _$SetCopyWithImpl<$Res, _$SetImpl>
    implements _$$SetImplCopyWith<$Res> {
  __$$SetImplCopyWithImpl(_$SetImpl _value, $Res Function(_$SetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isFinished = null,
    Object? flashcards = freezed,
  }) {
    return _then(_$SetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcards: freezed == flashcards
          ? _value._flashcards
          : flashcards // ignore: cast_nullable_to_non_nullable
              as List<({String image_url, String quizStatusId})>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetImpl with DiagnosticableTreeMixin implements _Set {
  const _$SetImpl(
      {required this.id,
      @Assert('name.length <= $kMaxSetNameLength',
          'Name should not be more than $kMaxSetNameLength characters')
      required this.name,
      @Assert('description.length <= $kMaxSetDescriptionLength',
          'Description should not be more than $kMaxSetDescriptionLength characters')
      this.description,
      required this.userId,
      required this.createdAt,
      required this.updatedAt,
      this.isFinished = false,
      final List<({String image_url, String quizStatusId})>? flashcards})
      : _flashcards = flashcards;

  factory _$SetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetImplFromJson(json);

  @override
  final String id;
  @override
  @Assert('name.length <= $kMaxSetNameLength',
      'Name should not be more than $kMaxSetNameLength characters')
  final String name;
  @override
  @Assert('description.length <= $kMaxSetDescriptionLength',
      'Description should not be more than $kMaxSetDescriptionLength characters')
  final String? description;
  @override
  final String userId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isFinished;
  final List<({String image_url, String quizStatusId})>? _flashcards;
  @override
  List<({String image_url, String quizStatusId})>? get flashcards {
    final value = _flashcards;
    if (value == null) return null;
    if (_flashcards is EqualUnmodifiableListView) return _flashcards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Set(id: $id, name: $name, description: $description, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, isFinished: $isFinished, flashcards: $flashcards)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Set'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('isFinished', isFinished))
      ..add(DiagnosticsProperty('flashcards', flashcards));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            const DeepCollectionEquality()
                .equals(other._flashcards, _flashcards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      userId,
      createdAt,
      updatedAt,
      isFinished,
      const DeepCollectionEquality().hash(_flashcards));

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetImplCopyWith<_$SetImpl> get copyWith =>
      __$$SetImplCopyWithImpl<_$SetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetImplToJson(
      this,
    );
  }
}

abstract class _Set implements Set {
  const factory _Set(
      {required final String id,
      @Assert('name.length <= $kMaxSetNameLength',
          'Name should not be more than $kMaxSetNameLength characters')
      required final String name,
      @Assert('description.length <= $kMaxSetDescriptionLength',
          'Description should not be more than $kMaxSetDescriptionLength characters')
      final String? description,
      required final String userId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isFinished,
      final List<({String image_url, String quizStatusId})>?
          flashcards}) = _$SetImpl;

  factory _Set.fromJson(Map<String, dynamic> json) = _$SetImpl.fromJson;

  @override
  String get id;
  @override
  @Assert('name.length <= $kMaxSetNameLength',
      'Name should not be more than $kMaxSetNameLength characters')
  String get name;
  @override
  @Assert('description.length <= $kMaxSetDescriptionLength',
      'Description should not be more than $kMaxSetDescriptionLength characters')
  String? get description;
  @override
  String get userId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isFinished;
  @override
  List<({String image_url, String quizStatusId})>? get flashcards;

  /// Create a copy of Set
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetImplCopyWith<_$SetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
