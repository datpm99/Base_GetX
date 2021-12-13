import 'package:base_getx/const/const.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key, required this.content}) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_outline,
                color: Colors.green, size: 28),
            const Gap(5),
            Text(
              content,
              style: Styles.mediumTextBold(),
              textAlign: TextAlign.center,
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
