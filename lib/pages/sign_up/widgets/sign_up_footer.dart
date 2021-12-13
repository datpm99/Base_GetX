import 'package:base_getx/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'do_you_already_have_an_account'.tr} ',
          style: Styles.mediumText(color: Colors.grey),
        ),
        InkWell(
          //onTap: () => Get.offNamed(Routes.SIGNUP),
          child: Text(
            'sign_in'.tr,
            style: Styles.mediumTextBold(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
