import 'package:base_getx/core/models/select_common_model.dart';
import 'package:base_getx/lang/lang_controller.dart';
import 'package:base_getx/utils/app_utils.dart';
import 'package:base_getx/widgets/get_input_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_fields.dart';

class ProfileController extends GetxController {
  final _fields = ProfileFields();
  final lang = Get.find<LangController>();
  DateTime dateNow = DateTime.now();
  DateTime selectedDate = DateTime.now();

  //final SignUpService _service = SignUpService();

  GetInputTextConfig get fullName => _fields.fullName;

  GetInputTextConfig get email => _fields.email;

  GetInputTextConfig get address => _fields.address;

  TextEditingController dob = TextEditingController();

  //List Gender.
  List<SelectCommonModel> lstGender = [];
  late SelectCommonModel valueGender;

  @override
  void onInit() {
    super.onInit();
    initDataGender();
  }

  void initDataGender() {
    lstGender.add(SelectCommonModel(id: 0, title: 'male'.tr));
    lstGender.add(SelectCommonModel(id: 1, title: 'female'.tr));
    lstGender.add(SelectCommonModel(id: 2, title: 'other'.tr));
    valueGender = lstGender.first;
  }

  void selectedGender(SelectCommonModel model) {
    valueGender = model;
    update();
  }

  //DateTimePicker.
  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      locale: lang.locale,
      context: context,
      initialDate: DateTime(dateNow.year - 20),
      firstDate: DateTime(dateNow.year - 100),
      lastDate: DateTime(dateNow.year - 14),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dob.text = AppUtils.formatDate(selectedDate);
    }
  }

  void updateProfile() {}

  void onCameraImg() {}

  void onUploadImg() {}
}
