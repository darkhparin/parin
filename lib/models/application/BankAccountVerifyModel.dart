// To parse this JSON data, do
//
//     final bankAccountVerifyModel = bankAccountVerifyModelFromJson(jsonString);

import 'dart:convert';

BankAccountVerifyModel bankAccountVerifyModelFromJson(String str) =>
    BankAccountVerifyModel.fromJson(json.decode(str));

String bankAccountVerifyModelToJson(BankAccountVerifyModel data) =>
    json.encode(data.toJson());

class BankAccountVerifyModel {
  BankAccountVerifyModel({
    this.referenceId,
    this.accountExists,
    this.amountDeposited,
    this.message,
    this.nameAtBank,
  });

  String referenceId;
  bool accountExists;
  int amountDeposited;
  String message;
  String nameAtBank;

  factory BankAccountVerifyModel.fromJson(Map<String, dynamic> json) =>
      BankAccountVerifyModel(
        referenceId: json["reference_id"],
        accountExists: json["account_exists"],
        amountDeposited: json["amount_deposited"],
        message: json["message"],
        nameAtBank: json["name_at_bank"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "account_exists": accountExists,
        "amount_deposited": amountDeposited,
        "message": message,
        "name_at_bank": nameAtBank,
      };
}
