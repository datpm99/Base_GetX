import 'package:base_getx/const/const.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, required this.content}) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 40),
            const Gap(20),
            Text(
              content,
              style: Styles.mediumText(),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
