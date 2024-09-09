import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:Imabulary/app/Wallet/domain/package/package.dart';
import 'package:Imabulary/shared/models/ServerResponse/server_response.dart';
import 'package:Imabulary/utils/api.dart';
import 'package:Imabulary/utils/request.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'packages_repository.g.dart';

/// This class works with packages and their information that we store in our internal DB
class PackagesRepository {
  PackagesRepository({required this.qonversion, required this.dio});

  final Qonversion qonversion;
  final Dio dio;

  Future<ServerResponse<List<Package>>> findAll() {
    return request(() async {
      final result = await dio.get('${dotenv.env['API_URL']}/packages');

      return ServerResponse.extract(result, Package.fromJson);
    });
  }
}

@riverpod
PackagesRepository packagesRepository(PackagesRepositoryRef ref) =>
    PackagesRepository(
      qonversion: Qonversion.getSharedInstance(),
      dio: getDioClient(),
    );
