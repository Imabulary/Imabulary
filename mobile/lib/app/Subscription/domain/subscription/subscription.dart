import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/app/Subscription/domain/product/product.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

enum SubscriptionType { free, next }

@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    required String id,
    String? storeId,
    required String name,
    required String description,
    required String price,
    required Benefits benefits,
    required String icon,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}
