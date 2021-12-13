import 'package:base_getx/const/const.dart';
import 'package:base_getx/widgets/divider_form.dart';
import 'package:base_getx/widgets/img_asset_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'sign_up_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widgets/sign_up_footer.dart';
import 'widgets/sign_up_form.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const ImgAssetWidget(img: 'assets/images/logo.png', size: 200),
              Text(
                'sign_up'.tr.toUpperCase(),
                style: Styles.cusTextBold(size: 24, color: Colors.grey),
              ),
              const Gap(40),
              const SignUpForm(),
              const DividerForm().py(30),
              const SignUpFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
