import 'package:base_getx/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _initState();
  }

  void _initState() async {
    await 3.delay();
    Get.offAllNamed(Routes.root);
  }
}
