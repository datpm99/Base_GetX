import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    required this.status,
    required this.payload,
  });

  int status;
  Otp payload;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        status: json["status"],
        payload: Otp.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "payload": payload.toJson(),
      };
}

class Otp {
  Otp({
    required this.id,
    required this.username,
    required this.phone,
    required this.accessToken,
    required this.message,
  });

  int id;
  String username;
  String phone;
  String accessToken;
  String message;

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        id: json["id"] ?? 0,
        username: json["username"] ?? '',
        phone: json["phone"] ?? '',
        accessToken: json["accessToken"] ?? '',
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "phone": phone,
        "accessToken": accessToken,
        "message": message,
      };
}
