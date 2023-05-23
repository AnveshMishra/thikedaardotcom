// To parse this JSON data, do
//
//     final designYourHouseResponseModel = designYourHouseResponseModelFromJson(jsonString);

import 'dart:convert';

DesignYourHouseResponseModel designYourHouseResponseModelFromJson(String str) =>
    DesignYourHouseResponseModel.fromJson(json.decode(str));

String designYourHouseResponseModelToJson(DesignYourHouseResponseModel data) =>
    json.encode(data.toJson());

class DesignYourHouseResponseModel {
  final String? message;
  final Data? data;

  DesignYourHouseResponseModel({
    this.message,
    this.data,
  });

  DesignYourHouseResponseModel copyWith({
    String? message,
    Data? data,
  }) =>
      DesignYourHouseResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory DesignYourHouseResponseModel.fromJson(Map<String, dynamic> json) =>
      DesignYourHouseResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final String? city;
  final int? numberofFloors;
  final int? plotLength;
  final int? plotWidth;
  final String? requireBasement;
  final String? requierStilt;
  final dynamic ipAddress;
  final String? id;
  final int? v;

  Data({
    this.city,
    this.numberofFloors,
    this.plotLength,
    this.plotWidth,
    this.requireBasement,
    this.requierStilt,
    this.ipAddress,
    this.id,
    this.v,
  });

  Data copyWith({
    String? city,
    int? numberofFloors,
    int? plotLength,
    int? plotWidth,
    String? requireBasement,
    String? requierStilt,
    dynamic ipAddress,
    String? id,
    int? v,
  }) =>
      Data(
        city: city ?? this.city,
        numberofFloors: numberofFloors ?? this.numberofFloors,
        plotLength: plotLength ?? this.plotLength,
        plotWidth: plotWidth ?? this.plotWidth,
        requireBasement: requireBasement ?? this.requireBasement,
        requierStilt: requierStilt ?? this.requierStilt,
        ipAddress: ipAddress ?? this.ipAddress,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        city: json["city"],
        numberofFloors: json["numberofFloors"],
        plotLength: json["plotLength"],
        plotWidth: json["plotWidth"],
        requireBasement: json["requireBasement"],
        requierStilt: json["requierStilt"],
        ipAddress: json["ipAddress"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "numberofFloors": numberofFloors,
        "plotLength": plotLength,
        "plotWidth": plotWidth,
        "requireBasement": requireBasement,
        "requierStilt": requierStilt,
        "ipAddress": ipAddress,
        "_id": id,
        "__v": v,
      };
}
