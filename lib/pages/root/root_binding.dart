import 'package:base_getx/pages/pages.dart';
import 'package:get/get.dart';
import 'root_controller.dart';

/// Put all controller of screen in bottomNavBar.
class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootController());
    Get.put(NoticeController());
    Get.put(ReportController());
    Get.put(HomeController());
    Get.put(UnitController());
    Get.put(UserController());
  }
}
