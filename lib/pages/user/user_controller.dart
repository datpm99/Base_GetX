import 'package:base_getx/const/const.dart';
import 'package:base_getx/widgets/dialogs/lang_dialog.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxBool modeLight = true.obs;
  RxString textMode = 'light_mode'.obs;

  void onSignOut() {}

  void onChangeTheme() {
    modeLight.value = !modeLight.value;
    if (modeLight.value) textMode.value = 'light_mode';
    if (!modeLight.value) textMode.value = 'dark_mode';
    Styles.changeTheme();
  }

  void onProfile() => Get.toNamed(Routes.profile);

  void onLanguage() => Get.dialog(LangDialog());

  void onSignIn() => Get.toNamed(Routes.signIn);

  void onSignUp() => Get.toNamed(Routes.signUp);

  void onOtp() => Get.toNamed(Routes.otp);
}
