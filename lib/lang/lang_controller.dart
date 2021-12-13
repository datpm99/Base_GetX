import 'package:base_getx/services/storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangController extends GetxController {
  final _storage = Get.find<StorageService>();
  Locale locale = const Locale('vi', 'VN');
  String localVal = '';

  @override
  void onInit() {
    super.onInit();
    localVal = _storage.langDefault;
    var loc = localVal.split('_');
    if (loc.length < 2) loc = ['vi', 'VN'];
    locale = Locale(loc[0], loc[1]);
  }

  Future<void> changeLang(String l1, String l2) async {
    Get.updateLocale(Locale(l1, l2));
    localVal = l1 + '_' + l2;
    _storage.langDefault = localVal;
  }
}
