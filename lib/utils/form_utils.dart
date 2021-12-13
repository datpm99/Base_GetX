import 'package:base_getx/const/const.dart';
import 'package:get/get.dart';

const String regexPassword =
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,32}$";
const String regexPhone =
    r"^(0)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}\b";

const String regexName =
    r"^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s|_]+$";

const String regexCaptcha = r"^[0-9a-zA-Z]+$";
const String regexEmail = r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$";

/// String mess error.
String msgEmail = 'msg_valid_malformed'.trParams({'label': 'Email'.tr});
String msgPassword = 'msg_valid_password'.trParams({
  'min': AppConst.minPassword.toString(),
  'max': AppConst.maxPassword.toString(),
});
String msgFullName = 'msg_valid_fullName'.trParams({
  'max': AppConst.maxFullName.toString(),
});
String msgCaptcha = 'msg_valid_malformed'.trParams({'label': 'Captcha'});
String msgPhone = 'msg_valid_malformed'.trParams({'label': 'phone'.tr});

class FormUtils {
  static String email(String val) {
    val = val.trim();
    RegExp regex = RegExp(regexEmail);
    if (val.isEmpty) return 'msg_valid_required_common'.tr;
    if (val.length < AppConst.minEmail) return msgEmail;
    if (val.length > AppConst.maxEmail) return msgEmail;
    if (!val.isEmail) return msgEmail;
    if (!regex.hasMatch(val)) return msgEmail;
    return '';
  }

  static String password(String val) {
    RegExp regex = RegExp(regexPassword);
    if (val.isEmpty) return 'msg_valid_required_common'.tr;
    if (val.length < AppConst.minPassword) return msgPassword;
    if (val.length > AppConst.maxPassword) return msgPassword;
    if (!regex.hasMatch(val)) return msgPassword;
    return '';
  }

  static String matchPasswords(String val1, String val2) {
    if (val1.isEmpty) return 'msg_valid_required_common'.tr;
    if (val2.isEmpty) return 'msg_valid_required_common'.tr;
    if (val1 != val2) return 'msg_valid_match_password'.tr;
    return '';
  }

  static String captcha(String val) {
    val = val.trim();
    RegExp regex = RegExp(regexCaptcha);
    if (val.isEmpty) return 'msg_valid_required_common'.tr;
    if (val.length < AppConst.minCaptcha) return msgCaptcha;
    if (val.length > AppConst.maxCaptcha) return msgCaptcha;
    if (!regex.hasMatch(val)) return msgCaptcha;
    return '';
  }

  static String phone(String val) {
    val = val.trim();
    RegExp regex = RegExp(regexPhone);
    if (val.isEmpty) return 'msg_valid_required_common'.tr;
    if (val.length < AppConst.minPhone) return msgPhone;
    if (val.length > AppConst.maxPhone) return msgPhone;
    if (val.contains(' ')) return msgPhone;
    if (!regex.hasMatch(val)) return msgPhone;
    return '';
  }

  static String fullName(String val) {
    val = val.trim();
    RegExp regex = RegExp(regexName);
    if (val.isEmpty) return 'msg_valid_required_common'.tr;
    if (val.length < AppConst.minFullName) return msgFullName;
    if (val.length > AppConst.maxFullName) return msgFullName;
    if(!val.contains(' ')) return msgFullName;

    if (!regex.hasMatch(val)) return msgFullName;
    return '';
  }
}
