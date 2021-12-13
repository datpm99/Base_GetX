import 'package:base_getx/const/const.dart';
import 'package:base_getx/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_form.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text('personal_info'.tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const ProfileAvatar(),
            const ProfileForm(),
            SizedBox(
              height: 50,
              width: Get.width,
              child: CustomButton(
                onTap: controller.updateProfile,
                text: 'update'.tr.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
