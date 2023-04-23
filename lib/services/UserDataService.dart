import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataService {
  static Future<Map<String, dynamic>> generateUserData() async {
    final Map<String, dynamic> userData = {};
    print('qq user data');

    // 生成使用者設備資訊
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      userData['device'] = {
        'platform': 'android',
        'version': androidInfo.version.release,
        'device': androidInfo.device,
        'model': androidInfo.model,
        'manufacturer': androidInfo.manufacturer,
      };
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      userData['device'] = {
        'platform': 'ios',
        'version': iosInfo.systemVersion,
        'device': iosInfo.name,
        'model': iosInfo.model,
        'manufacturer': 'Apple',
      };
    }

    // 生成使用者位置資訊
    final Geolocator geolocator = Geolocator();
    final Position position = await Geolocator.getCurrentPosition();
    userData['location'] = {
      'latitude': position.latitude,
      'longitude': position.longitude,
    };

    // 生成應用程式資訊
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    userData['app'] = {
      'name': packageInfo.appName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
    };

    // 生成其他使用者資訊
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');
    userData['userId'] = userId;

    return userData;
  }
}