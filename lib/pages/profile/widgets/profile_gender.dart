import 'package:base_getx/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../profile_controller.dart';

class ProfileGender extends GetView<ProfileController> {
  const ProfileGender({Key? key}) : super(key: key);

  List<DropdownMenuItem<Object?>> buildDropdownTestItems() {
    List<DropdownMenuItem<Object?>> items = [];
    for (var model in controller.lstGender) {
      items.add(
        DropdownMenuItem(
          value: model,
          child: Text(model.title, style: const TextStyle(color: Colors.black)),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    if (controller.lstGender.isEmpty) return const SizedBox.shrink();
    return GetBuilder<ProfileController>(builder: (controller) {
      return DropdownWidget(
        value: controller.valueGender,
        hint: controller.valueGender.title,
        onChanged: controller.selectedGender,
        items: buildDropdownTestItems(),
        itemWidth: Get.width - 40,
      );
    });
  }
}
