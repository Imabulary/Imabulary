import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:Imabulary/app/Wallet/domain/award/award.dart';
import 'package:Imabulary/app/Wallet/domain/wallet/wallet.dart';
import 'package:Imabulary/utils/api.dart';
import 'package:Imabulary/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet_repository.g.dart';

class WalletRepository {
  WalletRepository({required this.dio});

  final Dio dio;

  Future<Wallet> getBalance() {
    return request(() async {
      final url = '${dotenv.env['API_URL']}/wallet';

      final response = await dio.get(url);

      return Wallet.fromJson(response.data!['result']);
    });
  }

  Future<CollectedAward> collectAward() {
    return request(() async {
      final url = '${dotenv.env['API_URL']}/wallet/collect';

      final response = await dio.put(url);

      return CollectedAward.fromJson(response.data!['result']);
    });
  }
}

@riverpod
WalletRepository walletRepository(WalletRepositoryRef ref) =>
    WalletRepository(dio: getDioClient());
