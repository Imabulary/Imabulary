import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'object_on_image.freezed.dart';
part 'object_on_image.g.dart';

@freezed
class ObjectOnImage with _$ObjectOnImage {
  const factory ObjectOnImage({required String name, required double score}) =
      _ObjectOnImage;

  factory ObjectOnImage.fromJson(Map<String, dynamic> json) =>
      _$ObjectOnImageFromJson(json);
}
