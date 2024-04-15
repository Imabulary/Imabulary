import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set.freezed.dart';
part 'set.g.dart';

// ignore: non_constant_identifier_names
typedef SetsFlashcards = ({String image_url});

@freezed
class Set with _$Set {
  const factory Set({
    required String id,
    required String name,
    String? description,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<SetsFlashcards>? flashCards,
  }) = _Set;

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);
}
