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

CreateNoDiseredObjectDTO _$CreateNoDiseredObjectDTOFromJson(
    Map<String, dynamic> json) {
  return _CreateNoDiseredObjectDTO.fromJson(json);
}

/// @nodoc
mixin _$CreateNoDiseredObjectDTO {
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get objectsOnImage => throw _privateConstructorUsedError;

  /// Serializes this CreateNoDiseredObjectDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateNoDiseredObjectDTOCopyWith<CreateNoDiseredObjectDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNoDiseredObjectDTOCopyWith<$Res> {
  factory $CreateNoDiseredObjectDTOCopyWith(CreateNoDiseredObjectDTO value,
          $Res Function(CreateNoDiseredObjectDTO) then) =
      _$CreateNoDiseredObjectDTOCopyWithImpl<$Res, CreateNoDiseredObjectDTO>;
  @useResult
  $Res call({String imageUrl, List<String> objectsOnImage});
}

/// @nodoc
class _$CreateNoDiseredObjectDTOCopyWithImpl<$Res,
        $Val extends CreateNoDiseredObjectDTO>
    implements $CreateNoDiseredObjectDTOCopyWith<$Res> {
  _$CreateNoDiseredObjectDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? objectsOnImage = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      objectsOnImage: null == objectsOnImage
          ? _value.objectsOnImage
          : objectsOnImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateNoDiseredObjectDTOImplCopyWith<$Res>
    implements $CreateNoDiseredObjectDTOCopyWith<$Res> {
  factory _$$CreateNoDiseredObjectDTOImplCopyWith(
          _$CreateNoDiseredObjectDTOImpl value,
          $Res Function(_$CreateNoDiseredObjectDTOImpl) then) =
      __$$CreateNoDiseredObjectDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageUrl, List<String> objectsOnImage});
}

/// @nodoc
class __$$CreateNoDiseredObjectDTOImplCopyWithImpl<$Res>
    extends _$CreateNoDiseredObjectDTOCopyWithImpl<$Res,
        _$CreateNoDiseredObjectDTOImpl>
    implements _$$CreateNoDiseredObjectDTOImplCopyWith<$Res> {
  __$$CreateNoDiseredObjectDTOImplCopyWithImpl(
      _$CreateNoDiseredObjectDTOImpl _value,
      $Res Function(_$CreateNoDiseredObjectDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? objectsOnImage = null,
  }) {
    return _then(_$CreateNoDiseredObjectDTOImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      objectsOnImage: null == objectsOnImage
          ? _value._objectsOnImage
          : objectsOnImage // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateNoDiseredObjectDTOImpl implements _CreateNoDiseredObjectDTO {
  const _$CreateNoDiseredObjectDTOImpl(
      {required this.imageUrl, required final List<String> objectsOnImage})
      : _objectsOnImage = objectsOnImage;

  factory _$CreateNoDiseredObjectDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateNoDiseredObjectDTOImplFromJson(json);

  @override
  final String imageUrl;
  final List<String> _objectsOnImage;
  @override
  List<String> get objectsOnImage {
    if (_objectsOnImage is EqualUnmodifiableListView) return _objectsOnImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objectsOnImage);
  }

  @override
  String toString() {
    return 'CreateNoDiseredObjectDTO(imageUrl: $imageUrl, objectsOnImage: $objectsOnImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNoDiseredObjectDTOImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._objectsOnImage, _objectsOnImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl,
      const DeepCollectionEquality().hash(_objectsOnImage));

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNoDiseredObjectDTOImplCopyWith<_$CreateNoDiseredObjectDTOImpl>
      get copyWith => __$$CreateNoDiseredObjectDTOImplCopyWithImpl<
          _$CreateNoDiseredObjectDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateNoDiseredObjectDTOImplToJson(
      this,
    );
  }
}

abstract class _CreateNoDiseredObjectDTO implements CreateNoDiseredObjectDTO {
  const factory _CreateNoDiseredObjectDTO(
          {required final String imageUrl,
          required final List<String> objectsOnImage}) =
      _$CreateNoDiseredObjectDTOImpl;

  factory _CreateNoDiseredObjectDTO.fromJson(Map<String, dynamic> json) =
      _$CreateNoDiseredObjectDTOImpl.fromJson;

  @override
  String get imageUrl;
  @override
  List<String> get objectsOnImage;

  /// Create a copy of CreateNoDiseredObjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateNoDiseredObjectDTOImplCopyWith<_$CreateNoDiseredObjectDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FeedbackDTO _$FeedbackDTOFromJson(Map<String, dynamic> json) {
  return _FeedbackDTO.fromJson(json);
}

/// @nodoc
mixin _$FeedbackDTO {
  String get message => throw _privateConstructorUsedError;
  String get deviceType => throw _privateConstructorUsedError;
  String get deviceModel => throw _privateConstructorUsedError;
  String get osName => throw _privateConstructorUsedError;
  String get osVersion => throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;
  String get buildNumber => throw _privateConstructorUsedError;
  String get networkType => throw _privateConstructorUsedError;
  String get screenResolution => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get userEmail => throw _privateConstructorUsedError;
  String? get accountType => throw _privateConstructorUsedError;
  String? get subscriptionStatus => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  /// Serializes this FeedbackDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackDTOCopyWith<FeedbackDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackDTOCopyWith<$Res> {
  factory $FeedbackDTOCopyWith(
          FeedbackDTO value, $Res Function(FeedbackDTO) then) =
      _$FeedbackDTOCopyWithImpl<$Res, FeedbackDTO>;
  @useResult
  $Res call(
      {String message,
      String deviceType,
      String deviceModel,
      String osName,
      String osVersion,
      String appVersion,
      String buildNumber,
      String networkType,
      String screenResolution,
      String userId,
      String? userEmail,
      String? accountType,
      String? subscriptionStatus,
      Map<String, dynamic>? additionalData,
      String country});
}

/// @nodoc
class _$FeedbackDTOCopyWithImpl<$Res, $Val extends FeedbackDTO>
    implements $FeedbackDTOCopyWith<$Res> {
  _$FeedbackDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? deviceType = null,
    Object? deviceModel = null,
    Object? osName = null,
    Object? osVersion = null,
    Object? appVersion = null,
    Object? buildNumber = null,
    Object? networkType = null,
    Object? screenResolution = null,
    Object? userId = null,
    Object? userEmail = freezed,
    Object? accountType = freezed,
    Object? subscriptionStatus = freezed,
    Object? additionalData = freezed,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: null == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String,
      osName: null == osName
          ? _value.osName
          : osName // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      networkType: null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as String,
      screenResolution: null == screenResolution
          ? _value.screenResolution
          : screenResolution // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionStatus: freezed == subscriptionStatus
          ? _value.subscriptionStatus
          : subscriptionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackDTOImplCopyWith<$Res>
    implements $FeedbackDTOCopyWith<$Res> {
  factory _$$FeedbackDTOImplCopyWith(
          _$FeedbackDTOImpl value, $Res Function(_$FeedbackDTOImpl) then) =
      __$$FeedbackDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String deviceType,
      String deviceModel,
      String osName,
      String osVersion,
      String appVersion,
      String buildNumber,
      String networkType,
      String screenResolution,
      String userId,
      String? userEmail,
      String? accountType,
      String? subscriptionStatus,
      Map<String, dynamic>? additionalData,
      String country});
}

/// @nodoc
class __$$FeedbackDTOImplCopyWithImpl<$Res>
    extends _$FeedbackDTOCopyWithImpl<$Res, _$FeedbackDTOImpl>
    implements _$$FeedbackDTOImplCopyWith<$Res> {
  __$$FeedbackDTOImplCopyWithImpl(
      _$FeedbackDTOImpl _value, $Res Function(_$FeedbackDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? deviceType = null,
    Object? deviceModel = null,
    Object? osName = null,
    Object? osVersion = null,
    Object? appVersion = null,
    Object? buildNumber = null,
    Object? networkType = null,
    Object? screenResolution = null,
    Object? userId = null,
    Object? userEmail = freezed,
    Object? accountType = freezed,
    Object? subscriptionStatus = freezed,
    Object? additionalData = freezed,
    Object? country = null,
  }) {
    return _then(_$FeedbackDTOImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: null == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String,
      osName: null == osName
          ? _value.osName
          : osName // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      networkType: null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as String,
      screenResolution: null == screenResolution
          ? _value.screenResolution
          : screenResolution // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionStatus: freezed == subscriptionStatus
          ? _value.subscriptionStatus
          : subscriptionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackDTOImpl implements _FeedbackDTO {
  const _$FeedbackDTOImpl(
      {required this.message,
      required this.deviceType,
      required this.deviceModel,
      required this.osName,
      required this.osVersion,
      required this.appVersion,
      required this.buildNumber,
      required this.networkType,
      required this.screenResolution,
      required this.userId,
      this.userEmail,
      this.accountType,
      this.subscriptionStatus,
      final Map<String, dynamic>? additionalData,
      required this.country})
      : _additionalData = additionalData;

  factory _$FeedbackDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackDTOImplFromJson(json);

  @override
  final String message;
  @override
  final String deviceType;
  @override
  final String deviceModel;
  @override
  final String osName;
  @override
  final String osVersion;
  @override
  final String appVersion;
  @override
  final String buildNumber;
  @override
  final String networkType;
  @override
  final String screenResolution;
  @override
  final String userId;
  @override
  final String? userEmail;
  @override
  final String? accountType;
  @override
  final String? subscriptionStatus;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String country;

  @override
  String toString() {
    return 'FeedbackDTO(message: $message, deviceType: $deviceType, deviceModel: $deviceModel, osName: $osName, osVersion: $osVersion, appVersion: $appVersion, buildNumber: $buildNumber, networkType: $networkType, screenResolution: $screenResolution, userId: $userId, userEmail: $userEmail, accountType: $accountType, subscriptionStatus: $subscriptionStatus, additionalData: $additionalData, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackDTOImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.osName, osName) || other.osName == osName) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber) &&
            (identical(other.networkType, networkType) ||
                other.networkType == networkType) &&
            (identical(other.screenResolution, screenResolution) ||
                other.screenResolution == screenResolution) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.subscriptionStatus, subscriptionStatus) ||
                other.subscriptionStatus == subscriptionStatus) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      deviceType,
      deviceModel,
      osName,
      osVersion,
      appVersion,
      buildNumber,
      networkType,
      screenResolution,
      userId,
      userEmail,
      accountType,
      subscriptionStatus,
      const DeepCollectionEquality().hash(_additionalData),
      country);

  /// Create a copy of FeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackDTOImplCopyWith<_$FeedbackDTOImpl> get copyWith =>
      __$$FeedbackDTOImplCopyWithImpl<_$FeedbackDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackDTOImplToJson(
      this,
    );
  }
}

abstract class _FeedbackDTO implements FeedbackDTO {
  const factory _FeedbackDTO(
      {required final String message,
      required final String deviceType,
      required final String deviceModel,
      required final String osName,
      required final String osVersion,
      required final String appVersion,
      required final String buildNumber,
      required final String networkType,
      required final String screenResolution,
      required final String userId,
      final String? userEmail,
      final String? accountType,
      final String? subscriptionStatus,
      final Map<String, dynamic>? additionalData,
      required final String country}) = _$FeedbackDTOImpl;

  factory _FeedbackDTO.fromJson(Map<String, dynamic> json) =
      _$FeedbackDTOImpl.fromJson;

  @override
  String get message;
  @override
  String get deviceType;
  @override
  String get deviceModel;
  @override
  String get osName;
  @override
  String get osVersion;
  @override
  String get appVersion;
  @override
  String get buildNumber;
  @override
  String get networkType;
  @override
  String get screenResolution;
  @override
  String get userId;
  @override
  String? get userEmail;
  @override
  String? get accountType;
  @override
  String? get subscriptionStatus;
  @override
  Map<String, dynamic>? get additionalData;
  @override
  String get country;

  /// Create a copy of FeedbackDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackDTOImplCopyWith<_$FeedbackDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
