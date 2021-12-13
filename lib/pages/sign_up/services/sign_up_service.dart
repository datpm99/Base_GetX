import 'package:base_getx/pages/sign_up/models/requests/sign_up_request.dart';
import 'package:base_getx/pages/sign_up/models/sign_up_model.dart';
import 'package:base_getx/services/api/api_config.dart';
import 'package:base_getx/services/api/api_service.dart';
import 'package:base_getx/services/api/base_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpService extends BaseService {
  final ApiService _apiService = Get.find<ApiService>();

  Future<SignUpModel?> signUp(SignUpRequest request) async {
    try {
      var response = await _apiService.postRequest(
        AuthenticateApis.signIn,
        request.toJson(),
        '',
      );
      if (response != null) {
        var data = getDataFromResponse(response);
        SignUpModel result = signUpModelFromJson(data);
        return result;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
