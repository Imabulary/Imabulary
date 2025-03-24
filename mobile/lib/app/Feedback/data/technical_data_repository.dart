import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Feedback/data/dto/technical_data_dto.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class DeviceInfoRetriever {
  Future retrieveDeviceInfo(Size screenSize, PackageInfo packageInfo,
      ConnectivityResult connectivity);
}

class AndroidDeviceInfoRetriever implements DeviceInfoRetriever {
  final DeviceInfoPlugin _deviceInfo;

  AndroidDeviceInfoRetriever(this._deviceInfo);

  @override
  Future retrieveDeviceInfo(Size screenSize, PackageInfo packageInfo,
      ConnectivityResult connectivity) async {
    final androidInfo = await _deviceInfo.androidInfo;
    return TechnicalDataDto(
      deviceType: 'smartphone',
      deviceModel: androidInfo.model,
      osName: 'Android',
      osVersion: androidInfo.version.release,
      appVersion: packageInfo.version,
      appBuildNumber: packageInfo.buildNumber,
      networkType: connectivity.toString(),
      screenResolution:
          '${screenSize.width.toStringAsFixed(2)}x${screenSize.height.toStringAsFixed(2)}',
    );
  }
}

class IOSDeviceInfoRetriever implements DeviceInfoRetriever {
  final DeviceInfoPlugin _deviceInfo;

  IOSDeviceInfoRetriever(this._deviceInfo);

  @override
  Future retrieveDeviceInfo(Size screenSize, PackageInfo packageInfo,
      ConnectivityResult connectivity) async {
    final iosInfo = await _deviceInfo.iosInfo;
    return TechnicalDataDto(
      deviceType: 'smartphone',
      deviceModel: iosInfo.model,
      osName: 'iOS',
      osVersion: iosInfo.systemVersion,
      appVersion: packageInfo.version,
      appBuildNumber: packageInfo.buildNumber,
      networkType: connectivity.toString(),
      screenResolution:
          '${screenSize.width.toStringAsFixed(2)}x${screenSize.height.toStringAsFixed(2)}',
    );
  }
}

class UnknownDeviceInfoRetriever implements DeviceInfoRetriever {
  @override
  Future retrieveDeviceInfo(Size screenSize, PackageInfo packageInfo,
      ConnectivityResult connectivity) async {
    return TechnicalDataDto(
      deviceType: 'unknown',
      deviceModel: 'unknown',
      osName: 'unknown',
      osVersion: 'unknown',
      appVersion: packageInfo.version,
      appBuildNumber: packageInfo.buildNumber,
      networkType: connectivity.toString(),
      screenResolution:
          '${screenSize.width.toStringAsFixed(2)}x${screenSize.height.toStringAsFixed(2)}',
    );
  }
}

class TechnicalDataRepository {
  final DeviceInfoRetriever _deviceInfoRetriever;

  TechnicalDataRepository(this._deviceInfoRetriever);

  Future getTechnicalData(Size screenSize) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final connectivity = await Connectivity().checkConnectivity();
    return _deviceInfoRetriever.retrieveDeviceInfo(
      screenSize,
      packageInfo,
      connectivity.first,
    );
  }

  static TechnicalDataRepository getRepository() {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return TechnicalDataRepository(AndroidDeviceInfoRetriever(deviceInfo));
    } else if (Platform.isIOS) {
      return TechnicalDataRepository(IOSDeviceInfoRetriever(deviceInfo));
    } else {
      return TechnicalDataRepository(UnknownDeviceInfoRetriever());
    }
  }
}
