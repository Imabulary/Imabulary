import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Feedback/data/dto/technical_data_dto.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'technical_data_repository.g.dart';

class TechnicalDataRepository {
  final DeviceInfoPlugin _deviceInfo;
  final Connectivity _connectivity;

  TechnicalDataRepository({
    DeviceInfoPlugin? deviceInfo,
    Connectivity? connectivity,
  })  : _deviceInfo = deviceInfo ?? DeviceInfoPlugin(),
        _connectivity = connectivity ?? Connectivity();

  Future<TechnicalDataDto> getTechnicalData(
    Size screenSize,
  ) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final connectivity = await _connectivity.checkConnectivity();

    Map<String, String> deviceData = await _getDeviceInfo();

    return TechnicalDataDto(
      deviceType: deviceData['deviceType'] ?? 'unknown',
      deviceModel: deviceData['deviceModel'] ?? 'unknown',
      osName: deviceData['osName'] ?? 'unknown',
      osVersion: deviceData['osVersion'] ?? 'unknown',
      appVersion: packageInfo.version,
      appBuildNumber: packageInfo.buildNumber,
      networkType: connectivity.toString(),
      screenResolution: '${screenSize.width}x${screenSize.height}',
    );
  }

  Future<Map<String, String>> _getDeviceInfo() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      return {
        'deviceType': 'smartphone',
        'deviceModel': androidInfo.model,
        'osName': 'Android',
        'osVersion': androidInfo.version.release,
      };
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      return {
        'deviceType': 'smartphone',
        'deviceModel': iosInfo.model,
        'osName': 'iOS',
        'osVersion': iosInfo.systemVersion,
      };
    }
    return {};
  }
}

@riverpod
TechnicalDataRepository technicalDataRepository(
    TechnicalDataRepositoryRef ref) {
  return TechnicalDataRepository();
}
