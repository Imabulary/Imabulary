import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Profile/data/user_repository.dart';

final findCurrentUserSubscriptionProvider = FutureProvider.autoDispose(
  (ref) => ref.watch(userRepositoryProvider).findSubscription(),
);
