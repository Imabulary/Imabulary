import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/shared/constants.dart';
part 'set.freezed.dart';
part 'set.g.dart';

// ignore: non_constant_identifier_names
typedef SetsFlashcards = ({String image_url});

@freezed
class Set with _$Set {
  const factory Set({
    required String id,
    @NameValidation()  String name,
    @DescriptionValidation() String? description,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<SetsFlashcards>? flashcards,
  }) = _Set;

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);
}

class NameValidation implements JsonConverter<String, String> {
  const NameValidation();

  @override
  String fromJson(String json) {
    if (json.length > maxSetNameLength) {
      throw ArgumentError('Name cannot be longer than ${maxSetNameLength} characters');
    }
    return json;
  }

  @override
  String toJson(String object) => object;
}

class DescriptionValidation implements JsonConverter<String?, String?> {
  const DescriptionValidation();

  @override
  String? fromJson(String? json) {
    if (json != null && json.length > maxSetDescriptionLength) {
      throw ArgumentError('Description cannot be longer than ${maxSetDescriptionLength} characters');
    }
    return json;
  }

  @override
  String? toJson(String? object) => object;
}