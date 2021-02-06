// To parse this JSON data, do
//
//     final saveKycVerificationModel = saveKycVerificationModelFromJson(jsonString);

import 'dart:convert';

SaveKycVerificationModel saveKycVerificationModelFromJson(String str) =>
    SaveKycVerificationModel.fromJson(json.decode(str));

String saveKycVerificationModelToJson(SaveKycVerificationModel data) =>
    json.encode(data.toJson());

class SaveKycVerificationModel {
  SaveKycVerificationModel({
    this.partyId,
    this.firstName,
    this.lastName,
    this.isVerified,
    this.isTesting,
  });

  int partyId;
  String firstName;
  String lastName;
  bool isVerified;
  bool isTesting;

  factory SaveKycVerificationModel.fromJson(Map<String, dynamic> json) =>
      SaveKycVerificationModel(
        partyId: json["partyId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        isVerified: json["isVerified"],
        isTesting: json["isTesting"],
      );

  Map<String, dynamic> toJson() => {
        "partyId": partyId,
        "firstName": firstName,
        "lastName": lastName,
        "isVerified": isVerified,
        "isTesting": isTesting,
      };
}
