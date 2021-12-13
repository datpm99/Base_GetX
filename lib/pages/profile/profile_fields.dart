import 'package:base_getx/const/const.dart';
import 'package:base_getx/utils/form_utils.dart';
import 'package:base_getx/widgets/get_input_text.dart';
import 'package:flutter/material.dart';

class ProfileFields {
  GetInputTextConfig fullName = GetInputTextConfig(
    label: 'full_name',
    onValidate: FormUtils.fullName,
    keyboardType: TextInputType.text,
    maxLength: AppConst.maxFullName,
    validationPlace: ValidationPlace.focus,
    colorBorder: Styles.grey3,
  );
  GetInputTextConfig email = GetInputTextConfig(
    label: 'email',
    onValidate: FormUtils.email,
    keyboardType: TextInputType.emailAddress,
    maxLength: AppConst.maxEmail,
    validationPlace: ValidationPlace.change,
    colorBorder: Styles.grey3,
  );

  GetInputTextConfig address = GetInputTextConfig(
    label: 'address',
    onValidate: (p0) {
      return '';
    },
    keyboardType: TextInputType.text,
    maxLength: AppConst.maxFullName,
    validationPlace: ValidationPlace.change,
    colorBorder: Styles.grey3,
  );
}
