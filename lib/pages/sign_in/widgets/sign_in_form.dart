import 'package:base_getx/widgets/buttons/custom_button.dart';
import 'package:base_getx/widgets/get_input_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sign_in_controller.dart';

class SignInForm extends GetView<SignInController> {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetInputText(config: controller.phone),
        const SizedBox(height: 20),
        GetInputText(config: controller.password),
        Row(children: [
          const Spacer(),
          GestureDetector(
            //onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
            child: Text(
              "forgot_password".tr,
              style: TextStyle(
                color: Colors.grey[600],
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ]),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: CustomButton(
            onTap: controller.onSignIn,
            text: 'sign_in'.tr.toUpperCase(),
          ),
        ),
      ],
    );
  }
}
