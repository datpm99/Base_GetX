import 'dart:convert';

class SignInRequest {
  SignInRequest({
    required this.phone,
    required this.password,
    required this.deviceId,
    required this.deviceType,
  });

  String phone;
  String password;
  String deviceId;
  int deviceType;

  Map<String, dynamic> toMap() => {
        "phone": phone,
        "password": password,
        "deviceId": deviceId,
        "deviceType": deviceType,
      };

  String toJson() => json.encode(toMap());
}
