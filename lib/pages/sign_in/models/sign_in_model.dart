import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    required this.status,
    required this.payload,
  });

  int status;
  SignIn payload;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        status: json["status"],
        payload: SignIn.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "payload": payload.toJson(),
      };
}

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

class SignIn {
  SignIn({
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

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        id: json["id"],
        username: json["username"],
        phone: json["phone"],
        accessToken: json["accessToken"],
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "phone": phone,
        "accessToken": accessToken,
        "message": message,
      };

  String toJson() => json.encode(toMap());
}
