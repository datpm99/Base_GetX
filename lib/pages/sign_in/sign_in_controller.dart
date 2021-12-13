import 'package:base_getx/const/const.dart';
import 'package:base_getx/services/storage/storage_service.dart';
import 'package:base_getx/utils/app_utils.dart';
import 'package:base_getx/widgets/dialogs/error_dialog.dart';
import 'package:base_getx/widgets/get_input_text.dart';
import 'package:get/get.dart';
import 'models/requests/sign_in_request.dart';
import 'models/sign_in_model.dart';
import 'services/sign_in_service.dart';
import 'sign_in_fields.dart';

class SignInController extends GetxController {
  final _fields = SignInFields();
  final _storageService = Get.find<StorageService>();
  final SignInService _service = SignInService();

  GetInputTextConfig get phone => _fields.phone;

  GetInputTextConfig get password => _fields.password;

  void onSignIn() {
    bool isPhone = phone.validate();
    bool isPassword = password.validate();
    if (isPhone && isPassword) {
      print('login success!');
      Get.back();
    }
  }

  Future<void> _signIn() async {
    AppUtils.showLoading();
    SignInRequest request = SignInRequest(
      phone: phone.value.trim(),
      password: password.value,
      deviceId: _storageService.deviceID,
      deviceType: 1,
    );
    var result = await _service.signIn(request);
    await AppUtils.hideLoading();
    if (result != null && result.status == StatusCode.ok) {
      _resetData();
      _saveDataWithSuccess(result);
      Get.offAllNamed(Routes.root);
    } else if (result != null &&
        result.status != StatusCode.ok &&
        result.payload.message.isNotEmpty) {
      Get.dialog(ErrorDialog(content: result.payload.message));
    } else {
      Get.dialog(ErrorDialog(content: 'msg_error_have_error'.tr));
    }
  }

  void _saveDataWithSuccess(SignInModel data) {
    _storageService.apiToken = data.payload.accessToken;
    _storageService.userInfo = data.payload.toJson();
  }

  void _resetData() {
    phone.value = '';
    password.value = '';
  }
}
