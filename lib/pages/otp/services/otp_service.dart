import 'dart:convert';
import 'package:base_getx/pages/otp/models/otp_model.dart';
import 'package:base_getx/pages/otp/models/requests/otp_request.dart';
import 'package:base_getx/services/api/api_config.dart';
import 'package:base_getx/services/api/api_service.dart';
import 'package:base_getx/services/api/base_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpService extends BaseService {
  final ApiService _apiService = Get.find<ApiService>();

  Future<OtpModel?> otpVerify(OtpRequest request) async {
    try {
      var response = await _apiService.postRequest(
          AuthenticateApis.otp, request.toJson(), '');
      if (response != null) {
        var data = getDataFromResponse(response);
        OtpModel result = otpModelFromJson(data);
        return result;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<OtpModel?> resendOtp(String phone) async {
    try {
      var request = {'phone': phone};
      var response = await _apiService.postRequest(
          AuthenticateApis.resendOtp, jsonEncode(request), '');
      if (response != null) {
        var data = getDataFromResponse(response);
        OtpModel result = otpModelFromJson(data);
        return result;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
