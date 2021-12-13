import 'package:base_getx/const/const.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

//How to use: https://pub.dev/packages/dropdown_below

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    Key? key,
    required this.items,
    required this.hint,
    this.iconData = Icons.keyboard_arrow_down,
    required this.onChanged,
    this.value,
    this.itemWidth = 200,
  }) : super(key: key);
  final List<DropdownMenuItem<Object?>> items;
  final String hint;
  final IconData iconData;
  final Function onChanged;
  final dynamic value;
  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return DropdownBelow(
      boxDecoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      itemWidth: itemWidth,
      itemTextstyle: Styles.normalText(color: Styles.primaryColor),
      boxTextstyle: Styles.normalText(color: Colors.grey),
      boxPadding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
      boxWidth: Get.size.width.truncateToDouble(),
      boxHeight: 58,
      hint: hint.tr.text.make(),
      value: value,
      items: items,
      onChanged: (selected) {
        onChanged(selected);
      },
      icon: Icon(iconData, color: Colors.black),
    ).py(5);
  }
}
