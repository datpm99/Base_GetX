import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.status,
    required this.payload,
  });

  int status;
  SignUp payload;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json["status"],
        payload: SignUp.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "payload": payload.toJson(),
      };
}

class SignUp {
  SignUp({
    required this.name,
    required this.phone,
    required this.message,
  });

  String name;
  String phone;
  String message;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        name: json["name"] ?? '',
        phone: json["phone"] ?? '',
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "message": message,
      };
}
