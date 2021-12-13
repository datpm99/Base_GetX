import 'package:base_getx/const/theme/styles.dart';
import 'package:base_getx/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'you_do_not_have_an_account'.tr} ',
          style: Styles.mediumText(color: Colors.grey),
        ),
        InkWell(
          //onTap: () => Get.offNamed(Routes.SIGNUP),
          child: Text(
            'sign_up'.tr,
            style: Styles.mediumTextBold(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
