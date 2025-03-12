// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetDTO _$SetDTOFromJson(Map<String, dynamic> json) {
  return _SetDTO.fromJson(json);
}

/// @nodoc
mixin _$SetDTO {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get is_finished => throw _privateConstructorUsedError;

  /// Serializes this SetDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetDTOCopyWith<SetDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetDTOCopyWith<$Res> {
  factory $SetDTOCopyWith(SetDTO value, $Res Function(SetDTO) then) =
      _$SetDTOCopyWithImpl<$Res, SetDTO>;
  @useResult
  $Res call({String? name, String? description, bool is_finished});
}

/// @nodoc
class _$SetDTOCopyWithImpl<$Res, $Val extends SetDTO>
    implements $SetDTOCopyWith<$Res> {
  _$SetDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? is_finished = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      is_finished: null == is_finished
          ? _value.is_finished
          : is_finished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetDTOImplCopyWith<$Res> implements $SetDTOCopyWith<$Res> {
  factory _$$SetDTOImplCopyWith(
          _$SetDTOImpl value, $Res Function(_$SetDTOImpl) then) =
      __$$SetDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? description, bool is_finished});
}

/// @nodoc
class __$$SetDTOImplCopyWithImpl<$Res>
    extends _$SetDTOCopyWithImpl<$Res, _$SetDTOImpl>
    implements _$$SetDTOImplCopyWith<$Res> {
  __$$SetDTOImplCopyWithImpl(
      _$SetDTOImpl _value, $Res Function(_$SetDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? is_finished = null,
  }) {
    return _then(_$SetDTOImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      is_finished: null == is_finished
          ? _value.is_finished
          : is_finished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetDTOImpl implements _SetDTO {
  const _$SetDTOImpl({this.name, this.description, this.is_finished = false});

  factory _$SetDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetDTOImplFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool is_finished;

  @override
  String toString() {
    return 'SetDTO(name: $name, description: $description, is_finished: $is_finished)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDTOImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.is_finished, is_finished) ||
                other.is_finished == is_finished));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, is_finished);

  /// Create a copy of SetDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDTOImplCopyWith<_$SetDTOImpl> get copyWith =>
      __$$SetDTOImplCopyWithImpl<_$SetDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetDTOImplToJson(
      this,
    );
  }
}

abstract class _SetDTO implements SetDTO {
  const factory _SetDTO(
      {final String? name,
      final String? description,
      final bool is_finished}) = _$SetDTOImpl;

  factory _SetDTO.fromJson(Map<String, dynamic> json) = _$SetDTOImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  bool get is_finished;

  /// Create a copy of SetDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetDTOImplCopyWith<_$SetDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FindAllSetsDTO _$FindAllSetsDTOFromJson(Map<String, dynamic> json) {
  return _FindAllSetsDTO.fromJson(json);
}

/// @nodoc
mixin _$FindAllSetsDTO {
  Pagination get pagination => throw _privateConstructorUsedError;
  String? get filterStrategy => throw _privateConstructorUsedError;
  String? get statusId => throw _privateConstructorUsedError;

  /// Serializes this FindAllSetsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindAllSetsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindAllSetsDTOCopyWith<FindAllSetsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllSetsDTOCopyWith<$Res> {
  factory $FindAllSetsDTOCopyWith(
          FindAllSetsDTO value, $Res Function(FindAllSetsDTO) then) =
      _$FindAllSetsDTOCopyWithImpl<$Res, FindAllSetsDTO>;
  @useResult
  $Res call({Pagination pagination, String? filterStrategy, String? statusId});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$FindAllSetsDTOCopyWithImpl<$Res, $Val extends FindAllSetsDTO>
    implements $FindAllSetsDTOCopyWith<$Res> {
  _$FindAllSetsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindAllSetsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? filterStrategy = freezed,
    Object? statusId = freezed,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      filterStrategy: freezed == filterStrategy
          ? _value.filterStrategy
          : filterStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of FindAllSetsDTO
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
abstract class _$$FindAllSetsDTOImplCopyWith<$Res>
    implements $FindAllSetsDTOCopyWith<$Res> {
  factory _$$FindAllSetsDTOImplCopyWith(_$FindAllSetsDTOImpl value,
          $Res Function(_$FindAllSetsDTOImpl) then) =
      __$$FindAllSetsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pagination pagination, String? filterStrategy, String? statusId});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$FindAllSetsDTOImplCopyWithImpl<$Res>
    extends _$FindAllSetsDTOCopyWithImpl<$Res, _$FindAllSetsDTOImpl>
    implements _$$FindAllSetsDTOImplCopyWith<$Res> {
  __$$FindAllSetsDTOImplCopyWithImpl(
      _$FindAllSetsDTOImpl _value, $Res Function(_$FindAllSetsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindAllSetsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? filterStrategy = freezed,
    Object? statusId = freezed,
  }) {
    return _then(_$FindAllSetsDTOImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      filterStrategy: freezed == filterStrategy
          ? _value.filterStrategy
          : filterStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindAllSetsDTOImpl implements _FindAllSetsDTO {
  const _$FindAllSetsDTOImpl(
      {required this.pagination, this.filterStrategy, this.statusId});

  factory _$FindAllSetsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindAllSetsDTOImplFromJson(json);

  @override
  final Pagination pagination;
  @override
  final String? filterStrategy;
  @override
  final String? statusId;

  @override
  String toString() {
    return 'FindAllSetsDTO(pagination: $pagination, filterStrategy: $filterStrategy, statusId: $statusId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllSetsDTOImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.filterStrategy, filterStrategy) ||
                other.filterStrategy == filterStrategy) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pagination, filterStrategy, statusId);

  /// Create a copy of FindAllSetsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllSetsDTOImplCopyWith<_$FindAllSetsDTOImpl> get copyWith =>
      __$$FindAllSetsDTOImplCopyWithImpl<_$FindAllSetsDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindAllSetsDTOImplToJson(
      this,
    );
  }
}

abstract class _FindAllSetsDTO implements FindAllSetsDTO {
  const factory _FindAllSetsDTO(
      {required final Pagination pagination,
      final String? filterStrategy,
      final String? statusId}) = _$FindAllSetsDTOImpl;

  factory _FindAllSetsDTO.fromJson(Map<String, dynamic> json) =
      _$FindAllSetsDTOImpl.fromJson;

  @override
  Pagination get pagination;
  @override
  String? get filterStrategy;
  @override
  String? get statusId;

  /// Create a copy of FindAllSetsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindAllSetsDTOImplCopyWith<_$FindAllSetsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
