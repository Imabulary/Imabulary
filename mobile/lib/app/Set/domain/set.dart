import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/app/Quiz/domain/QuizStatus/quiz_status.dart';
import 'package:mobile/shared/constants.dart';

part 'set.freezed.dart';
part 'set.g.dart';

// ignore: non_constant_identifier_names
typedef SetsFlashcards = ({String image_url, QuizStatus QuizStatus});

@freezed
class Set with _$Set {
  const factory Set({
    required String id,
    @Assert(
      'name.length <= $kMaxSetNameLength',
      'Name should not be more than $kMaxSetNameLength characters',
    )
    required String name,
    @Assert(
      'description.length <= $kMaxSetDescriptionLength',
      'Description should not be more than $kMaxSetDescriptionLength characters',
    )
    String? description,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<SetsFlashcards>? flashcards,
  }) = _Set;

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);
}
