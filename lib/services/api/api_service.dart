import 'dart:convert';
import 'dart:io';
import 'package:base_getx/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const baseDOMAIN = 'http://192.168.1.3:8282';
const baseURL = '$baseDOMAIN/api/public/';

class ApiService {
  late Dio dio;

  interceptors() async {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (validateSessionTimeout(options.path)) {
        return handler.next(options);
      }
    }, onResponse: (response, handler) {
      if (!kReleaseMode) {
        debugPrint('=================================================\n');
        debugPrint('METHOD: ${response.requestOptions.method}');
        debugPrint('REQUEST: ${response.requestOptions.uri}');
        debugPrint('PARAMS: ${response.requestOptions.data}');
        debugPrint('HEADER: ${response.requestOptions.headers}');
        debugPrint('RESPONSE: ${jsonEncode(response.data)}');
        debugPrint('=================================================\n');
      }
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      debugPrint('=================================================\n');
      debugPrint('ERROR: ${e.message}');
      debugPrint('=================================================\n');
      return handler.next(e); //continue
    }));
  }

  validateSessionTimeout(String path) async {
    bool isAuth = path.contains('generateCaptcha') || path.contains('sign_in');
    if (!isAuth) {
      bool isLogin = AppUtils.isHaveUserInfo();
      bool isValidateSessionTimeout = AppUtils.validateSessionTimeout();
      if (isLogin) {
        if (!isValidateSessionTimeout) {
          await AppUtils.dialogTimeOut();
          AppUtils.logout();
          return false;
        }
        return true;
      } else {
        await AppUtils.dialogTimeOut();
        AppUtils.logout();
        return false;
      }
    }
    return true;
  }

  Future<void> init() async {
    dio = Dio(BaseOptions(
      baseUrl: baseURL,
      headers: {'content-type': 'application/json'},
    ));
    await interceptors();
  }

  Future<Response?> getRequest(String url, String sessionId) async {
    try {
      if (sessionId.isNotEmpty) dio.options.headers['session_id'] = sessionId;
      return await dio.get(url);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
      debugPrint(e.message);
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response?> postRequest(
      String url, String data, String sessionId) async {
    try {
      if (sessionId.isNotEmpty) dio.options.headers['session_id'] = sessionId;
      debugPrint('$url : $data');
      return await dio.post(url, data: data);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
      debugPrint(e.message);
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response?> uploadFile(File file, String url, String sessionId) async {
    try {
      String fileName = file.path.split('/').last;
      dio.options.headers['Authorization'] = 'Bearer $sessionId';
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      return await dio.post(url, data: formData);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
      debugPrint(e.message);
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
