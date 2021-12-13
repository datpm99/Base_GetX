import 'package:base_getx/pages/sign_in/models/requests/sign_in_request.dart';
import 'package:base_getx/pages/sign_in/models/sign_in_model.dart';
import 'package:base_getx/services/api/base_service.dart';
import 'package:base_getx/services/api/api_config.dart';
import 'package:base_getx/services/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInService extends BaseService {
  final ApiService _apiService = Get.find<ApiService>();

  Future<SignInModel?> signIn(SignInRequest request) async {
    try {
      var response = await _apiService.postRequest(
        AuthenticateApis.signIn,
        request.toJson(),
        '',
      );
      if (response != null) {
        var data = getDataFromResponse(response);
        SignInModel result = signInModelFromJson(data);
        return result;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
