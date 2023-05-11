// To parse this JSON data, do
//
//     final getDesignDataResponseModel = getDesignDataResponseModelFromJson(jsonString);

import 'dart:convert';

GetDesignDataResponseModel getDesignDataResponseModelFromJson(String str) =>
    GetDesignDataResponseModel.fromJson(json.decode(str));

String getDesignDataResponseModelToJson(GetDesignDataResponseModel data) =>
    json.encode(data.toJson());

class GetDesignDataResponseModel {
  final String? message;
  final List<DesignData>? data;

  GetDesignDataResponseModel({
    this.message,
    this.data,
  });

  GetDesignDataResponseModel copyWith({
    String? message,
    List<DesignData>? data,
  }) =>
      GetDesignDataResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory GetDesignDataResponseModel.fromJson(Map<String, dynamic> json) =>
      GetDesignDataResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DesignData>.from(
                json["data"]!.map((x) => DesignData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DesignData {
  final String? id;
  final String? uploadingUser;
  final String? suitableLocation;
  final String? plotLength;
  final String? plotWidth;
  final String? numberOfBedrooms;
  final String? numberOfToilets;
  final String? numberOfFloor;
  final String? buildingType;
  final bool? isVastu;
  final bool? isStiltdParking;
  final String? purpose;
  final String? specialFeature;
  final String? description;
  final dynamic approvalStatus;
  final int? v;

  DesignData({
    this.id,
    this.uploadingUser,
    this.suitableLocation,
    this.plotLength,
    this.plotWidth,
    this.numberOfBedrooms,
    this.numberOfToilets,
    this.numberOfFloor,
    this.buildingType,
    this.isVastu,
    this.isStiltdParking,
    this.purpose,
    this.specialFeature,
    this.description,
    this.approvalStatus,
    this.v,
  });

  DesignData copyWith({
    String? id,
    String? uploadingUser,
    String? suitableLocation,
    String? plotLength,
    String? plotWidth,
    String? numberOfBedrooms,
    String? numberOfToilets,
    String? numberOfFloor,
    String? buildingType,
    bool? isVastu,
    bool? isStiltdParking,
    String? purpose,
    String? specialFeature,
    String? description,
    dynamic approvalStatus,
    int? v,
  }) =>
      DesignData(
        id: id ?? this.id,
        uploadingUser: uploadingUser ?? this.uploadingUser,
        suitableLocation: suitableLocation ?? this.suitableLocation,
        plotLength: plotLength ?? this.plotLength,
        plotWidth: plotWidth ?? this.plotWidth,
        numberOfBedrooms: numberOfBedrooms ?? this.numberOfBedrooms,
        numberOfToilets: numberOfToilets ?? this.numberOfToilets,
        numberOfFloor: numberOfFloor ?? this.numberOfFloor,
        buildingType: buildingType ?? this.buildingType,
        isVastu: isVastu ?? this.isVastu,
        isStiltdParking: isStiltdParking ?? this.isStiltdParking,
        purpose: purpose ?? this.purpose,
        specialFeature: specialFeature ?? this.specialFeature,
        description: description ?? this.description,
        approvalStatus: approvalStatus ?? this.approvalStatus,
        v: v ?? this.v,
      );

  factory DesignData.fromJson(Map<String, dynamic> json) => DesignData(
        id: json["_id"],
        uploadingUser: json["uploadingUser"],
        suitableLocation: json["suitableLocation"],
        plotLength: json["plotLength"],
        plotWidth: json["plotWidth"],
        numberOfBedrooms: json["numberOfBedrooms"],
        numberOfToilets: json["numberOfToilets"],
        numberOfFloor: json["numberOfFloor"],
        buildingType: json["buildingType"],
        isVastu: json["isVastu"],
        isStiltdParking: json["isStiltdParking"],
        purpose: json["purpose"],
        specialFeature: json["specialFeature"],
        description: json["description"],
        approvalStatus: json["approvalStatus"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "uploadingUser": uploadingUser,
        "suitableLocation": suitableLocation,
        "plotLength": plotLength,
        "plotWidth": plotWidth,
        "numberOfBedrooms": numberOfBedrooms,
        "numberOfToilets": numberOfToilets,
        "numberOfFloor": numberOfFloor,
        "buildingType": buildingType,
        "isVastu": isVastu,
        "isStiltdParking": isStiltdParking,
        "purpose": purpose,
        "specialFeature": specialFeature,
        "description": description,
        "approvalStatus": approvalStatus,
        "__v": v,
      };
}
