import 'package:base_getx/const/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ValidationPlace { focus, change, manual }
enum ErrorMode { none, fixed, float }

class GetInputTextConfig extends GetxController {
  GetInputTextConfig({
    this.validationPlace = ValidationPlace.manual,
    this.keyboardType = TextInputType.text,
    this.showCounter = false,
    this.isPassword = false,
    this.maxLength = 100,
    this.label,
    this.hint,
    this.prefixIcon,
    this.onValidate,
    this.radiusBorder = 5.0,
    this.colorBorder = Colors.grey,
    this.colorFocusBorder = Styles.primaryColor,
    this.colorErrorBorder = Colors.red,
  });

  //Border.
  final double radiusBorder;
  final Color colorBorder;
  final Color colorFocusBorder;
  final Color colorErrorBorder;

  final ValidationPlace validationPlace;
  final TextInputType keyboardType;
  final bool showCounter;
  final bool isPassword;
  final int maxLength;
  final Function(String)? onValidate;

  final String? label;
  final String? hint;
  final IconData? prefixIcon;

  //Data.
  bool clearErrorOnFocus = true;
  bool clearErrorOnTyping = true;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool obscureText = false;

  String get value => controller.text;

  set value(String val) => controller.text = val;

  String error = '';

  bool validate() {
    error = onValidate!(value);
    update();
    return error.isEmpty;
  }

  void _handleFocus() {
    if (!focusNode.hasFocus && validationPlace == ValidationPlace.focus) {
      validate();
    } else {
      error = '';
    }
  }

  void _handleTextChange() {
    if (!focusNode.hasFocus && validationPlace == ValidationPlace.change) {
      error = '';
    } else {
      validate();
    }
  }

  Widget iconPassword() {
    return GestureDetector(
      onTap: () {
        obscureText = !obscureText;
        update();
      },
      child: Icon(
        obscureText ? Icons.visibility_off : Icons.visibility,
        color: Colors.grey[400],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    if (initialized) return;
    if (isPassword) obscureText = true;
    focusNode.addListener(_handleFocus);
    controller.addListener(_handleTextChange);
  }

  @override
  void onClose() {
    super.onClose();
    controller.removeListener(_handleTextChange);
    controller.dispose();
    focusNode.removeListener(_handleFocus);
    focusNode.unfocus();
    focusNode.dispose();
  }
}

class GetInputText extends StatelessWidget {
  const GetInputText({Key? key, required this.config}) : super(key: key);
  final GetInputTextConfig config;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: config,
      global: false,
      autoRemove: true,
      builder: (_) {
        return TextField(
          controller: config.controller,
          focusNode: config.focusNode,
          keyboardType: config.keyboardType,
          maxLength: config.maxLength,
          autocorrect: true,
          obscureText: config.obscureText,
          decoration: InputDecoration(
            labelText: (config.label != null) ? config.label!.tr : config.label,
            hintText: (config.hint != null) ? config.hint!.tr : config.hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radiusBorder),
              borderSide: BorderSide(color: config.colorBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radiusBorder),
              borderSide: BorderSide(color: config.colorFocusBorder),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radiusBorder),
              borderSide: BorderSide(color: config.colorErrorBorder),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radiusBorder),
              borderSide: BorderSide(color: config.colorErrorBorder),
            ),
            errorText: (config.error.isEmpty) ? null : config.error,
            errorMaxLines: 2,
            counterStyle: (config.showCounter)
                ? null
                : const TextStyle(color: Colors.transparent),
            //changeSize TextField.
            //contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            suffixIcon: (config.isPassword) ? config.iconPassword() : null,
          ),
        );
      },
    );
  }
}
