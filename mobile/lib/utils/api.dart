import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await FirebaseAuth.instance.currentUser!.getIdToken();

    log(token.toString());

    if (token != null) {
      options.headers['authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}

Dio getDioClient() {
  final dio = Dio();

  dio.interceptors.add(DioInterceptor());

  return dio;
}
