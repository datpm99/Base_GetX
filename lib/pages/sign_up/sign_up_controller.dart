import 'package:base_getx/const/const.dart';
import 'package:base_getx/utils/app_utils.dart';
import 'package:base_getx/widgets/dialogs/error_dialog.dart';
import 'package:base_getx/widgets/get_input_text.dart';
import 'package:get/get.dart';
import 'models/requests/sign_up_request.dart';
import 'services/sign_up_service.dart';
import 'sign_up_fields.dart';

class SignUpController extends GetxController {
  final _fields = SignUpFields();
  final SignUpService _service = SignUpService();

  GetInputTextConfig get fullName => _fields.fullName;

  GetInputTextConfig get phone => _fields.phone;

  GetInputTextConfig get password => _fields.password;

  void onSignUp() {
    bool isName = fullName.validate();
    bool isPhone = phone.validate();
    bool isPassword = password.validate();
    if (isName && isPhone && isPassword) {
      print('SignUp success!');
      Get.back();
    }
  }

  Future<void> _signUp() async {
    AppUtils.showLoading();
    SignUpRequest request = SignUpRequest(
      phone: phone.value.trim(),
      name: fullName.value.trim(),
      password: password.value,
    );
    var result = await _service.signUp(request);
    await AppUtils.hideLoading();
    if (result != null && result.status == StatusCode.ok) {
      _resetData();
      //TODO: Get.offNamed(Routes.OTP);
    } else if (result != null &&
        result.status != StatusCode.ok &&
        result.payload.message.isNotEmpty) {
      Get.dialog(ErrorDialog(content: result.payload.message));
    } else {
      Get.dialog(ErrorDialog(content: 'msg_error_have_error'.tr));
    }
  }

  void _resetData() {
    fullName.value = '';
    phone.value = '';
    password.value = '';
  }
}
