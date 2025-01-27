import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final Map<String, QEntitlement> entitlements =
        await Qonversion.getSharedInstance().checkEntitlements();

    print("ENTITLEMENT: $entitlements");

    options.headers['authorization'] = token != null ? 'Bearer $token' : '';

    super.onRequest(options, handler);
  }
}

Dio getDioClient() {
  final dio = Dio();

  dio.interceptors.add(DioInterceptor());

  return dio;
}
