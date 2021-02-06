// To parse this JSON data, do
//
//     final panVerifyModel = panVerifyModelFromJson(jsonString);

import 'dart:convert';

PanVerifyModel panVerifyModelFromJson(String str) =>
    PanVerifyModel.fromJson(json.decode(str));

String panVerifyModelToJson(PanVerifyModel data) => json.encode(data.toJson());

class PanVerifyModel {
  PanVerifyModel({
    this.pan,
    this.fullName,
    this.status,
    this.category,
  });

  String pan;
  String fullName;
  String status;
  String category;

  factory PanVerifyModel.fromJson(Map<String, dynamic> json) => PanVerifyModel(
        pan: json["pan"],
        fullName: json["full_name"],
        status: json["status"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "pan": pan,
        "full_name": fullName,
        "status": status,
        "category": category,
      };
}
