import 'package:base_getx/const/app_const.dart';
import 'package:get/get.dart';
import 'package:device_info/device_info.dart';

class NativeUtils {
  static void toBackground() {
    if (GetPlatform.isAndroid) {
      // bg.MoveToBackground.moveTaskToBack();
    }
  }

  static Future<String> deviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (GetPlatform.isAndroid) {
      var device = await deviceInfoPlugin.androidInfo;
      return '${device.manufacturer}|${device.model}|${device.androidId}|${AppConst.appName}|${AppConst.appVersion}';
    }
    if (GetPlatform.isIOS) {
      var device = await deviceInfoPlugin.iosInfo;
      return '${device.model}|${device.name}|${device.identifierForVendor}|${AppConst.appName}|${AppConst.appVersion}';
    }
    return '';
  }
}
