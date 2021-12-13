import 'package:base_getx/routes/routes.dart';
import 'package:base_getx/services/storage/storage_service.dart';
import 'package:base_getx/widgets/dialogs/error_dialog.dart';
import 'package:base_getx/widgets/dialogs/success_dialog.dart';
import 'package:base_getx/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
  static bool isLoading = false;

  /// Loading.
  static Future<void> hideLoading() async {
    if (!isLoading) return;
    isLoading = false;
    if (!Get.isSnackbarOpen!) Get.back();
  }

  static Future<void> showLoading() async {
    if (isLoading) return;
    isLoading = true;
    Get.dialog(const LoadingCircle(), barrierDismissible: false);
  }

  /// Show snackBar.
  static void showError(String error, {String title = 'error'}) {
    if (isLoading && Get.isDialogOpen!) hideLoading();
    Get.snackbar(
      title.tr,
      error,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: const Icon(Icons.error, color: Colors.white),
      animationDuration: 0.45.seconds,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.easeOutExpo,
      overlayColor: Colors.white54,
      overlayBlur: .1,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
    );
  }

  static void showSuccess(String mess, {String title = 'success'}) {
    if (isLoading && Get.isDialogOpen!) hideLoading();
    Get.snackbar(
      title.tr,
      mess,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      animationDuration: 0.45.seconds,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.easeOutExpo,
      overlayColor: Colors.white54,
      overlayBlur: .1,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
    );
  }

  /// unFocus current widget.
  static void unFocus() => Get.focusScope!.unfocus();

  /// SignIn.
  static bool isHaveUserInfo() {
    StorageService _storage = Get.find<StorageService>();
    return _storage.userInfo.isNotEmpty;
  }

  static bool validateSessionTimeout() {
    StorageService _storage = Get.find<StorageService>();
    String sessionTimeout = _storage.sessionTimeout;
    DateTime now = DateTime.now();
    if (sessionTimeout.isEmpty) {
      _storage.sessionTimeout = now.toString();
      return true;
    }
    DateTime? sessionTimeParse = DateTime.tryParse(sessionTimeout);
    var diff = now.difference(sessionTimeParse!).inMinutes;
    if (diff >= 0) {
      _storage.sessionTimeout = '';
      return false;
    }
    return true;
  }

  /// SignOut.
  static void logout() {
    clearData();
    Get.offAllNamed(Routes.signIn);
  }

  static void clearData() {
    StorageService _storage = Get.find<StorageService>();
    _storage.sessionTimeout = '';
    _storage.apiToken = '';
    _storage.userInfo = '';
  }

  /// Show Dialog.
  static Future<void> dialogUpdateSuccess(String param) async {
    Get.dialog(
      SuccessDialog(
          content: 'msg_update_success'.trParams({'label': param.tr})),
      barrierDismissible: false,
    );
    await 3.delay();
    Get.back();
  }

  static Future<void> dialogTimeOut() async {
    Get.dialog(
      const ErrorDialog(content: 'msg_error_session_timeout'),
      barrierDismissible: false,
    );
    await 3.delay();
    Get.back();
  }

  /// Format by 0979560***.
  static String maskPhone(String phone) {
    if (phone.isEmpty) return '';
    if (phone.length > 6) phone = '${phone.substring(0, 7)}***';
    return phone;
  }

  ///format date DD-MM-YYYY.
  static String formatDate(DateTime date) {
    String day = '';
    String month = '';
    if (date.day < 10) day = '0${date.day}';
    if (date.day >= 10) day = '${date.day}';
    if (date.month < 10) month = '0${date.month}';
    if (date.month >= 10) month = '${date.month}';
    return '$day-$month-${date.year}';
  }
}
