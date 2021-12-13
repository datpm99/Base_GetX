import 'package:base_getx/widgets/buttons/custom_button.dart';
import 'package:base_getx/widgets/get_input_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sign_up_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpForm extends GetView<SignUpController> {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetInputText(config: controller.fullName),
        GetInputText(config: controller.phone).py(20),
        GetInputText(config: controller.password),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: CustomButton(
            onTap: controller.onSignUp,
            text: 'sign_up'.tr.toUpperCase(),
          ),
        ),
      ],
    );
  }
}
