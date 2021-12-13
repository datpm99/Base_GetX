import 'package:base_getx/const/theme/styles.dart';
import 'package:base_getx/widgets/divider_form.dart';
import 'package:base_getx/widgets/img_asset_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';
import 'widgets/no_account_text.dart';
import 'widgets/sign_in_form.dart';
import 'package:velocity_x/velocity_x.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const ImgAssetWidget(img: 'assets/images/logo.png', size: 200),
              Text(
                'sign_in'.tr.toUpperCase(),
                style: Styles.cusTextBold(size: 24, color: Colors.grey),
              ),
              const Gap(40),
              const SignInForm(),
              const DividerForm().py(30),
              const NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
