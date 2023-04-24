// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.id,
    this.username,
    this.email,
    this.roles,
    this.token,
  });

  final String? id;
  final String? username;
  final String? email;
  final List<String>? roles;
  final String? token;

  LoginResponseModel copyWith({
    String? id,
    String? username,
    String? email,
    List<String>? roles,
    String? token,
  }) =>
      LoginResponseModel(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        roles: roles ?? this.roles,
        token: token ?? this.token,
      );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        roles: json["roles"] == null
            ? []
            : List<String>.from(json["roles"]!.map((x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
        "token": token,
      };
}
