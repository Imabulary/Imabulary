import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String internalId,
    required String name,
    required String description,
    String? externalId,
    required Benefits benefits,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Benefits with _$Benefits {
  const factory Benefits({
    required bool ads,
    required int sets,
    required int coins,
    required String coinsFrequency,
    int? flashcardsInSet,
  }) = _Benefits;

  factory Benefits.fromJson(Map<String, dynamic> json) =>
      _$BenefitsFromJson(json);
}
