// To parse this JSON data, do
//
//     final gpsRequestModel = gpsRequestModelFromJson(jsonString);

import 'dart:convert';

GpsRequestModel gpsRequestModelFromJson(String str) =>
    GpsRequestModel.fromJson(json.decode(str));

String gpsRequestModelToJson(GpsRequestModel data) =>
    json.encode(data.toJson());

class GpsRequestModel {
  GpsRequestModel({
    this.userId,
  });

  int userId;

  factory GpsRequestModel.fromJson(Map<String, dynamic> json) =>
      GpsRequestModel(
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
      };
}
