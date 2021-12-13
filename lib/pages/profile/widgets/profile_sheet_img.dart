import 'package:base_getx/const/const.dart';
import 'package:base_getx/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../profile_controller.dart';

class ProfileSheetImg extends GetView<ProfileController> {
  const ProfileSheetImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 56,
            child: OutlinedButton(
              onPressed: controller.onCameraImg,
              child: Text('take_a_photo'.tr, style: Styles.bigText()),
            ),
          ).expand(),
          const SizedBox(width: 5),
          SizedBox(
            height: 56,
            child: CustomButton(
              text: 'upload'.tr,
              onTap: controller.onUploadImg,
            ),
          ).expand(),
        ],
      ),
    );
  }
}
