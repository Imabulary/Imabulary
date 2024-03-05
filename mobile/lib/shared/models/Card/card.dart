// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class FlashCard with _$FlashCard {
  const factory FlashCard({
    required String id,
    required String word,
    required String phrase,
    required String translated_phrase,
    required String translated_word,
    required String target_language,
    required String source_language,
    required String image_url,
  }) = _FlashCard;

  factory FlashCard.fromJson(Map<String, dynamic> json) =>
      _$FlashCardFromJson(json);
}
