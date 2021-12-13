import 'package:base_getx/const/const.dart';
import 'package:base_getx/widgets/img_asset_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../root_controller.dart';

class BottomNavBar extends GetView<RootController> {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = controller.navBarData
        .map(
          (e) => BottomNavigationBarItem(
            icon: ImgAssetWidget(img: e.icon, size: 24, color: Colors.grey),
            label: e.name.tr,
            activeIcon: ImgAssetWidget(
                img: e.icon, size: 24, color: Styles.primaryColor),
          ),
        )
        .toList();
    return Obx(
      () => BottomNavigationBar(
        items: items,
        onTap: controller.onTapNav,
        currentIndex: controller.indexNavBar.value,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Styles.primaryColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
