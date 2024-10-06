import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'scan_photo_payload.freezed.dart';
part 'scan_photo_payload.g.dart';

@freezed
class ScanPhotoPayload with _$ScanPhotoPayload {
  const factory ScanPhotoPayload({
    required List<Map<String, dynamic>> translatedObjectsOnImage,
    required String imageUrl,
    required String generatedImageName,
  }) = _ScanPhotoPayload;

  factory ScanPhotoPayload.fromJson(Map<String, dynamic> json) =>
      _$ScanPhotoPayloadFromJson(json);
}
