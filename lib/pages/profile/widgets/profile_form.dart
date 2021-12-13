import 'package:base_getx/const/const.dart';
import 'package:base_getx/widgets/custom_text_field.dart';
import 'package:base_getx/widgets/get_input_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../profile_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'profile_gender.dart';

class ProfileForm extends GetView<ProfileController> {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('full_name'.tr, style: Styles.normalTextBold()).pOnly(bottom: 5),
        Focus(
          onFocusChange: (state) {
            if (!state) FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetInputText(config: controller.fullName),
        ),
        Text('dob'.tr, style: Styles.normalTextBold()).pOnly(bottom: 5),
        CustomTextField(
          controller: controller.dob,
          hint: 'msg_update',
          readOnly: true,
          suffixIcon: Icons.date_range_outlined,
          onTap: () => controller.selectDate(context),
        ).pOnly(bottom: 20),
        Text('gender'.tr, style: Styles.normalTextBold()).pOnly(bottom: 5),
        const ProfileGender().pOnly(bottom: 15),
        Text('Email', style: Styles.normalTextBold()).pOnly(bottom: 5),
        Focus(
          onFocusChange: (state) {
            if (!state) FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetInputText(config: controller.email),
        ),
        Text('address'.tr, style: Styles.normalTextBold()).pOnly(bottom: 5),
        Focus(
          onFocusChange: (state) {
            if (!state) FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetInputText(config: controller.address),
        ),
      ],
    );
  }
}
