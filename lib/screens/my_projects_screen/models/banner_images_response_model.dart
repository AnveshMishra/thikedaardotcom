// To parse this JSON data, do
//
//     final bannerImagesResponseModel = bannerImagesResponseModelFromJson(jsonString);

import 'dart:convert';

BannerImagesResponseModel bannerImagesResponseModelFromJson(String str) =>
    BannerImagesResponseModel.fromJson(json.decode(str));

String bannerImagesResponseModelToJson(BannerImagesResponseModel data) =>
    json.encode(data.toJson());

class BannerImagesResponseModel {
  final String? message;
  final List<Datum>? data;

  BannerImagesResponseModel({
    this.message,
    this.data,
  });

  BannerImagesResponseModel copyWith({
    String? message,
    List<Datum>? data,
  }) =>
      BannerImagesResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BannerImagesResponseModel.fromJson(Map<String, dynamic> json) =>
      BannerImagesResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? id;
  final String? value;

  Datum({
    this.id,
    this.value,
  });

  Datum copyWith({
    String? id,
    String? value,
  }) =>
      Datum(
        id: id ?? this.id,
        value: value ?? this.value,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
