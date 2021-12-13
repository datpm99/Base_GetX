import 'package:base_getx/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'root_controller.dart';
import 'widgets/bottom_navbar.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.indexNavBar.value,
          children: const [
            NoticeView(),
            ReportView(),
            HomeView(),
            UnitView(),
            UserView(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
