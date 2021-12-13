import 'package:get/get.dart';
import 'api/api_service.dart';
import 'storage/storage_service.dart';

class AppServices {
  static Future<void> init() async {
    Get.put(StorageService()).init();
    Get.put(ApiService()).init();
  }
}
