import 'package:base_getx/const/const.dart';
import 'package:base_getx/lang/lang_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LangDialog extends StatelessWidget {
  LangDialog({Key? key}) : super(key: key);
  final LangController lang = Get.find<LangController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('language'.tr, style: Styles.bigTextBold())
              .pOnly(left: 5, bottom: 10, top: 5),
          TextButton(
            onPressed: () {
              lang.changeLang('vn', 'VI');
              Get.back();
            },
            child: HStack([
              Image.asset('icons/flags/png/vn.png',
                  height: 30, width: 30, package: 'country_icons'),
              'lang_vi'.tr.text.capitalize.black.make().px(10)
            ]),
          ),
          TextButton(
            onPressed: () {
              lang.changeLang('en', 'US');
              Get.back();
            },
            child: HStack([
              Image.asset('icons/flags/png/us.png',
                  height: 30, width: 30, package: 'country_icons'),
              'lang_us'.tr.text.capitalize.black.make().px(10)
            ]),
          ),
        ],
      ).paddingAll(10),
    );
  }
}
