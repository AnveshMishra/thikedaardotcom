// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

ProductResponseModel productResponseModelFromJson(String str) =>
    ProductResponseModel.fromJson(json.decode(str));

String productResponseModelToJson(ProductResponseModel data) =>
    json.encode(data.toJson());

class ProductResponseModel {
  final String? message;
  final List<ProductData>? data;

  ProductResponseModel({
    this.message,
    this.data,
  });

  ProductResponseModel copyWith({
    String? message,
    List<ProductData>? data,
  }) =>

      ProductResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ProductData>.from(
                json["data"]!.map((x) => ProductData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductData {
  final List<String>? category;
  final String? id;
  final String? name;
  final String? price;
  final String? descriptionOne;
  final String? descriptionTwo;
  final String? descriptionThree;
  final dynamic status;
  final int? v;
  final dynamic image;
  final String? uploadUser;
  final bool? approvalStatus;

  ProductData({
    this.category,
    this.id,
    this.name,
    this.price,
    this.descriptionOne,
    this.descriptionTwo,
    this.descriptionThree,
    this.status,
    this.v,
    this.image,
    this.uploadUser,
    this.approvalStatus,
  });

  ProductData copyWith({
    List<String>? category,
    String? id,
    String? name,
    String? price,
    String? descriptionOne,
    String? descriptionTwo,
    String? descriptionThree,
    dynamic status,
    int? v,
    dynamic image,
    String? uploadUser,
    bool? approvalStatus,
  }) =>
      ProductData(
        category: category ?? this.category,
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        descriptionOne: descriptionOne ?? this.descriptionOne,
        descriptionTwo: descriptionTwo ?? this.descriptionTwo,
        descriptionThree: descriptionThree ?? this.descriptionThree,
        status: status ?? this.status,
        v: v ?? this.v,
        image: image ?? this.image,
        uploadUser: uploadUser ?? this.uploadUser,
        approvalStatus: approvalStatus ?? this.approvalStatus,
      );

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        category: json["category"] == null
            ? []
            : List<String>.from(json["category"]!.map((x) => x)),
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        descriptionOne: json["descriptionOne"],
        descriptionTwo: json["descriptionTwo"],
        descriptionThree: json["descriptionThree"],
        status: json["status"],
        v: json["__v"],
        image: json["image"],
        uploadUser: json["uploadUser"],
        approvalStatus: json["approvalStatus"],
      );

  Map<String, dynamic> toJson() => {
        "category":
            category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "_id": id,
        "name": name,
        "price": price,
        "descriptionOne": descriptionOne,
        "descriptionTwo": descriptionTwo,
        "descriptionThree": descriptionThree,
        "status": status,
        "__v": v,
        "image": image,
        "uploadUser": uploadUser,
        "approvalStatus": approvalStatus,
      };
}
