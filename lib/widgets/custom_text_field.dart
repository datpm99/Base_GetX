import 'package:base_getx/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.label,
    this.inputType = TextInputType.text,
    required this.controller,
    this.validate,
    this.maxLength = 100,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.paddingContent =
        const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    this.radiusBorder = 5.0,
    this.enabledBorderColor = Colors.grey,
    this.hint,
  }) : super(key: key);
  final String? label;
  final TextInputType inputType;
  final TextEditingController controller;
  final Function? validate;
  final int maxLength;
  final bool readOnly;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Function()? onTap;
  final EdgeInsetsGeometry paddingContent;
  final double radiusBorder;
  final Color enabledBorderColor;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      controller: controller,
      maxLength: maxLength,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: (label == null) ? null : label!.tr,
        hintText: (hint == null) ? null : hint!.tr,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusBorder),
          borderSide: BorderSide(color: enabledBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusBorder),
          borderSide: const BorderSide(color: Styles.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusBorder),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusBorder),
          borderSide: const BorderSide(color: Colors.red),
        ),
       // contentPadding: paddingContent,
        counterText: "",
        prefixIcon: (prefixIcon != null) ? Icon(prefixIcon) : null,
        suffixIcon: (suffixIcon != null) ? Icon(suffixIcon) : null,
      ),
    );
  }
}
