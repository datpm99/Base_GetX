import 'package:base_getx/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_sheet_img.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(backgroundColor: Styles.primaryColor),
          Positioned(
            right: -10,
            bottom: 0,
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.grey[400],
                ),
                onPressed: () => Get.bottomSheet(const ProfileSheetImg()),
                child: const Icon(Icons.camera_alt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
