import 'package:base_getx/lang/lang_controller.dart';
import 'package:base_getx/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_app.dart';

Future<void> initLanguage() async {
  Get.put(LangController());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.init();
  await initLanguage();
  runApp(MyApp());
}
