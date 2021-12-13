import 'package:base_getx/const/const.dart';
import 'package:base_getx/utils/form_utils.dart';
import 'package:base_getx/widgets/get_input_text.dart';
import 'package:flutter/material.dart';

class SignUpFields {
  GetInputTextConfig fullName = GetInputTextConfig(
    label: 'full_name',
    onValidate: FormUtils.fullName,
    keyboardType: TextInputType.text,
    maxLength: AppConst.maxFullName,
    validationPlace: ValidationPlace.focus,
    colorBorder: Styles.grey3,
  );
  GetInputTextConfig phone = GetInputTextConfig(
    label: 'phone',
    onValidate: FormUtils.phone,
    keyboardType: TextInputType.phone,
    maxLength: AppConst.maxPhone,
    validationPlace: ValidationPlace.focus,
    colorBorder: Styles.grey3,
  );

  GetInputTextConfig password = GetInputTextConfig(
    label: 'password',
    onValidate: FormUtils.password,
    maxLength: AppConst.maxPassword,
    isPassword: true,
    keyboardType: TextInputType.visiblePassword,
    validationPlace: ValidationPlace.focus,
    colorBorder: Styles.grey3,
  );
}
