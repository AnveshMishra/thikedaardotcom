// To parse this JSON data, do
//
//     final designRequestModel = designRequestModelFromJson(jsonString);

import 'dart:convert';

DesignRequestModel designRequestModelFromJson(String str) =>
    DesignRequestModel.fromJson(json.decode(str));

String designRequestModelToJson(DesignRequestModel data) =>
    json.encode(data.toJson());

class DesignRequestModel {
  final String? city;
  final int? numberofFloors;
  final int? plotLength;
  final int? plotWidth;
  final String? requireBasement;
  final String? requierStilt;
  final dynamic ip;

  DesignRequestModel({
    this.city,
    this.numberofFloors,
    this.plotLength,
    this.plotWidth,
    this.requireBasement,
    this.requierStilt,
    this.ip,
  });

  DesignRequestModel copyWith({
    String? city,
    int? numberofFloors,
    int? plotLength,
    int? plotWidth,
    String? requireBasement,
    String? requierStilt,
    dynamic ip,
  }) =>
      DesignRequestModel(
        city: city ?? this.city,
        numberofFloors: numberofFloors ?? this.numberofFloors,
        plotLength: plotLength ?? this.plotLength,
        plotWidth: plotWidth ?? this.plotWidth,
        requireBasement: requireBasement ?? this.requireBasement,
        requierStilt: requierStilt ?? this.requierStilt,
        ip: ip ?? this.ip,
      );

  factory DesignRequestModel.fromJson(Map<String, dynamic> json) =>
      DesignRequestModel(
        city: json["city"],
        numberofFloors: json["numberofFloors"],
        plotLength: json["plotLength"],
        plotWidth: json["plotWidth"],
        requireBasement: json["requireBasement"],
        requierStilt: json["requierStilt"],
        ip: json["ip"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "numberofFloors": numberofFloors,
        "plotLength": plotLength,
        "plotWidth": plotWidth,
        "requireBasement": requireBasement,
        "requierStilt": requierStilt,
        "ip": ip,
      };
}
