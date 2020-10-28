// To parse this JSON data, do
//
//     final getLastAttendanceResponce = getLastAttendanceResponceFromJson(jsonString);

import 'dart:convert';

GetLastAttendanceResponce getLastAttendanceResponceFromJson(String str) =>
    GetLastAttendanceResponce.fromJson(json.decode(str));

String getLastAttendanceResponceToJson(GetLastAttendanceResponce data) =>
    json.encode(data.toJson());

class GetLastAttendanceResponce {
  GetLastAttendanceResponce({
    this.attendanceId,
    this.employeeId,
    this.holidayYearId,
    this.attendaceDate,
    this.branchId,
    this.loginTime,
    this.logoutTime,
    this.attendanceType,
    this.isLocked,
  });

  int attendanceId;
  int employeeId;
  int holidayYearId;
  DateTime attendaceDate;
  int branchId;
  String loginTime;
  dynamic logoutTime;
  int attendanceType;
  bool isLocked;

  factory GetLastAttendanceResponce.fromJson(Map<String, dynamic> json) =>
      GetLastAttendanceResponce(
        attendanceId: json["attendanceId"],
        employeeId: json["employeeId"],
        holidayYearId: json["holidayYearId"],
        attendaceDate: DateTime.parse(json["attendaceDate"]),
        branchId: json["branchId"],
        loginTime: json["loginTime"],
        logoutTime: json["logoutTime"],
        attendanceType: json["attendanceType"],
        isLocked: json["isLocked"],
      );

  Map<String, dynamic> toJson() => {
        "attendanceId": attendanceId,
        "employeeId": employeeId,
        "holidayYearId": holidayYearId,
        "attendaceDate": attendaceDate.toIso8601String(),
        "branchId": branchId,
        "loginTime": loginTime,
        "logoutTime": logoutTime,
        "attendanceType": attendanceType,
        "isLocked": isLocked,
      };
}
