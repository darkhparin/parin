// To parse this JSON data, do
//
//     final getPartyContactDetailsModel = getPartyContactDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'dart:ffi';

GetPartyContactDetailsModel getPartyContactDetailsModelFromJson(String str) =>
    GetPartyContactDetailsModel.fromJson(json.decode(str));

String getPartyContactDetailsModelToJson(GetPartyContactDetailsModel data) =>
    json.encode(data.toJson());

class GetPartyContactDetailsModel {
  GetPartyContactDetailsModel({
    this.partyId,
    this.emailId,
    this.hasEmailAlert,
    this.isDeleted,
    this.gstin,
    this.gstinStatus,
    this.mobileNo,
    this.hasSmsAlert,
    this.officeNo,
    this.address,
    this.branch,
    this.branchId,
    this.contactPerson,
    this.pincode,
    this.productTypeId,
    this.productType,
    // this.branchDistance,
    this.branchPincode,
    this.isOda,
  });

  int partyId;
  String emailId;
  bool hasEmailAlert;
  bool isDeleted;
  String gstin;
  String gstinStatus;
  int mobileNo;
  bool hasSmsAlert;
  String officeNo;
  String address;
  String branch;
  int branchId;
  String contactPerson;
  int pincode;
  int productTypeId;
  String productType;
//  String branchDistance;
  int branchPincode;
  bool isOda;

  factory GetPartyContactDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetPartyContactDetailsModel(
        partyId: json["partyId"],
        emailId: json["emailId"],
        hasEmailAlert: json["hasEmailAlert"],
        isDeleted: json["isDeleted"],
        gstin: json["gstin"],
        gstinStatus: json["gstinStatus"],
        mobileNo: json["mobileNo"],
        hasSmsAlert: json["hasSmsAlert"],
        officeNo: json["officeNo"],
        address: json["address"],
        branch: json["branch"],
        branchId: json["branchId"],
        contactPerson: json["contactPerson"],
        pincode: json["pincode"],
        productTypeId: json["productTypeId"],
        productType: json["productType"],
        // branchDistance: json["branchDistance"],
        branchPincode: json["branchPincode"],
        isOda: json["isODA"],
      );

  Map<String, dynamic> toJson() => {
        "partyId": partyId,
        "emailId": emailId,
        "hasEmailAlert": hasEmailAlert,
        "isDeleted": isDeleted,
        "gstin": gstin,
        "gstinStatus": gstinStatus,
        "mobileNo": mobileNo,
        "hasSmsAlert": hasSmsAlert,
        "officeNo": officeNo,
        "address": address,
        "branch": branch,
        "branchId": branchId,
        "contactPerson": contactPerson,
        "pincode": pincode,
        "productTypeId": productTypeId,
        "productType": productType,
        // "branchDistance": branchDistance,
        "branchPincode": branchPincode,
        "isODA": isOda,
      };
}
