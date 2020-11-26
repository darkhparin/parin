// To parse this JSON data, do
//
//     final getPartyLatestListModel = getPartyLatestListModelFromJson(jsonString);

import 'dart:convert';

List<GetPartyLatestListModel> getPartyLatestListModelFromJson(String str) =>
    List<GetPartyLatestListModel>.from(
        json.decode(str).List((x) => GetPartyLatestListModel.fromJson(x)));

String getPartyLatestListModelToJson(List<GetPartyLatestListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<GetPartyLatestListModel> getPartyLatestListModel;

class GetPartyLatestListModel {
  GetPartyLatestListModel({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory GetPartyLatestListModel.fromJson(Map<String, dynamic> json) =>
      GetPartyLatestListModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
