import 'package:Imabulary/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'award_repository.g.dart';

const kLastAwardedAtKey = 'lastAwardedAt';

class AwardRepository {
  AwardRepository(this._storage);

  final Future<SharedPreferences> _storage;

  Future<String?> getLastAwardedAt() async {
    return request(() async {
      final storage = await _storage;

      return storage.getString(kLastAwardedAtKey);
    });
  }

  Future<void> setLastAwardedAt(String date) async {
    return request(() async {
      final storage = await _storage;

      await storage.setString(kLastAwardedAtKey, date);
    });
  }
}

@riverpod
AwardRepository awardRepository(AwardRepositoryRef ref) =>
    AwardRepository(SharedPreferences.getInstance());
