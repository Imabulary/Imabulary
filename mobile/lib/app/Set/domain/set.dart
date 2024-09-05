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
    @Assert('name.length <= ${maxSetNameLength}',
        'Name should not be more than ${maxSetNameLength} characters')
    String name,
    @Assert('description.length <= ${maxSetDescriptionLength}',
        'Description should not be more than ${maxSetDescriptionLength} characters')
    String? description,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<SetsFlashcards>? flashcards,
  }) = _Set;

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);
}