// To parse this JSON data, do
//
//     final postAttendanceRequestModel = postAttendanceRequestModelFromJson(jsonString);

import 'dart:convert';

PostAttendanceRequestModel postAttendanceRequestModelFromJson(String str) =>
    PostAttendanceRequestModel.fromJson(json.decode(str));

String postAttendanceRequestModelToJson(PostAttendanceRequestModel data) =>
    json.encode(data.toJson());

class PostAttendanceRequestModel {
  PostAttendanceRequestModel({
    this.latitude,
    this.longitude,
    this.attendancetype,
  });

  double latitude;
  double longitude;
  int attendancetype;

  factory PostAttendanceRequestModel.fromJson(Map<String, dynamic> json) =>
      PostAttendanceRequestModel(
        latitude: json["latitude"],
        longitude: json["longitude"],
        attendancetype: json["attendancetype"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "attendancetype": attendancetype,
      };
}
