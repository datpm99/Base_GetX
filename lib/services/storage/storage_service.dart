import 'package:base_getx/utils/native_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxController {
  static StorageService get() => Get.find();

  late GetStorage _box;
  late bool _isFirstLaunch;

  String get apiToken => _box.read(_Keys.apiToken) ?? '';
  set apiToken(String value) => _write(_Keys.apiToken, value);

  String get deviceInfo => _box.read(_Keys.deviceInfo) ?? '';
  set deviceInfo(String value) => _write(_Keys.deviceInfo, value);

  String get deviceID => _box.read(_Keys.deviceID) ?? '';
  set deviceID(String value) => _write(_Keys.deviceID, value);

  String get userInfo => _box.read(_Keys.userInfo) ?? '';
  set userInfo(String value) => _write(_Keys.userInfo, value);

  String get langDefault => _box.read(_Keys.langDefault) ?? '';
  set langDefault(String value) => _write(_Keys.langDefault, value);

  String get sessionTimeout => _box.read(_Keys.sessionTimeout) ?? '';
  set sessionTimeout(String value) => _write(_Keys.sessionTimeout, value);

  String get themeIsDark => _box.read(_Keys.themeIsDark) ?? '';
  set themeIsDark(String value) => _write(_Keys.themeIsDark, value);

  void init() async {
    _box = GetStorage('settings');
    await _box.initStorage;
    _isFirstLaunch = _box.read(_Keys.firstLaunch) ?? true;
    if (_isFirstLaunch) {
      _box.write(_Keys.firstLaunch, false);
      _box.write(_Keys.langDefault, 'vn_VI');
      deviceInfo = await NativeUtils.deviceInfo();
      deviceID = deviceInfo.split('|')[2];
    }
  }

  void reset() => _box.erase();

  void _write<T>(String key, T value) {
    value == '' ? _box.remove(key) : _box.write(key, value);
  }
}

/// Storage keys.
class _Keys {
  static const String firstLaunch = 'first_launch';
  static const String apiToken = 'api_token';
  static const String deviceInfo = 'deviceName';
  static const String deviceID = 'deviceID';
  static const String userInfo = 'user_info';
  static const String langDefault = 'lang_default';
  static const String sessionTimeout = 'sessionTimeout';

  static const String themeIsDark = 'theme_dark';
}
