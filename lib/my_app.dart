import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'const/const.dart';
import 'lang/lang_controller.dart';
import 'lang/translation_service.dart';
import 'utils/root_widget.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final LangController lang = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      enableLog: false,
      title: AppConst.appName,
      defaultTransition: Transition.native,
      theme: Styles.light,
      darkTheme: Styles.dark,
      initialRoute: AppPages.initPage,
      getPages: AppPages.routes,
      builder: RootWidget.builder,
      locale: lang.locale,
      fallbackLocale: TranslationService.fallbackLocate,
      translations: TranslationService(),
    );
  }
}
