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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, setId, const DeepCollectionEquality().hash(_flashcardIds));

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$OrganizeFlashcardDTOImplCopyWith<_$OrganizeFlashcardDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
