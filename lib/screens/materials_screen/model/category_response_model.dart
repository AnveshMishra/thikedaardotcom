// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'dart:convert';

CategoryResponseModel categoryResponseModelFromJson(String str) =>
    CategoryResponseModel.fromJson(json.decode(str));

String categoryResponseModelToJson(CategoryResponseModel data) =>
    json.encode(data.toJson());

class CategoryResponseModel {
  final String? message;
  final List<CategoryData>? data;

  CategoryResponseModel({
    this.message,
    this.data,
  });

  CategoryResponseModel copyWith({
    String? message,
    List<CategoryData>? data,
  }) =>
      CategoryResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CategoryData>.from(
                json["data"]!.map((x) => CategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategoryData {
  final String? id;
  final String? name;
  final int? v;
  final bool? active;
  final dynamic isDeleted;
  final int? position;
  final bool? approvalStatus;

  CategoryData({
    this.id,
    this.name,
    this.v,
    this.active,
    this.isDeleted,
    this.position,
    this.approvalStatus,
  });

  CategoryData copyWith({
    String? id,
    String? name,
    int? v,
    bool? active,
    dynamic isDeleted,
    int? position,
    bool? approvalStatus,
  }) =>
      CategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        v: v ?? this.v,
        active: active ?? this.active,
        isDeleted: isDeleted ?? this.isDeleted,
        position: position ?? this.position,
        approvalStatus: approvalStatus ?? this.approvalStatus,
      );

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
        active: json["active"],
        isDeleted: json["isDeleted"],
        position: json["position"],
        approvalStatus: json["approvalStatus"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
        "active": active,
        "isDeleted": isDeleted,
        "position": position,
        "approvalStatus": approvalStatus,
      };
}
