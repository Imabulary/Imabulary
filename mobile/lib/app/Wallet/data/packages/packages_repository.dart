import 'package:mobile/utils/request.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'packages_repository.g.dart';

class PackagesRepository {
  PackagesRepository({required this.qonversion});

  final Qonversion qonversion;

  findAll() {
    return request(() async {
      // We call the variable offerings here, because this is how packages are called in Qonversion
      final offerings = await qonversion.offerings();

      print(offerings.availableOfferings.map((offering) => offering.id));
    });
  }
}

@riverpod
PackagesRepository packagesRepository(PackagesRepositoryRef ref) =>
    PackagesRepository(qonversion: Qonversion.getSharedInstance());
