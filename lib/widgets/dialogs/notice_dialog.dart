import 'package:base_getx/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeDialog extends StatelessWidget {
  const NoticeDialog({Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(title),
      content: Text(content, style: Styles.normalText()),
      actions: [
        TextButton(onPressed: () => Get.back(), child: Text("yes".tr)),
      ],
    );
  }
}
