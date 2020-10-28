// To parse this JSON data, do
//
//     final postAttendanceReportRequestModel = postAttendanceReportRequestModelFromJson(jsonString);

import 'dart:convert';

PostAttendanceReportRequestModel postAttendanceReportRequestModelFromJson(
        String str) =>
    PostAttendanceReportRequestModel.fromJson(json.decode(str));

String postAttendanceReportRequestModelToJson(
        PostAttendanceReportRequestModel data) =>
    json.encode(data.toJson());

class PostAttendanceReportRequestModel {
  PostAttendanceReportRequestModel({
    this.lastAttendanceId,
    this.report,
  });

  int lastAttendanceId;
  String report;

  factory PostAttendanceReportRequestModel.fromJson(
          Map<String, dynamic> json) =>
      PostAttendanceReportRequestModel(
        lastAttendanceId: json["lastAttendanceId"],
        report: json["report"],
      );

  Map<String, dynamic> toJson() => {
        "lastAttendanceId": lastAttendanceId,
        "report": report,
      };
}
