// To parse this JSON data, do
//
//     final gpsResponceModel = gpsResponceModelFromJson(jsonString);

import 'dart:convert';

GpsResponceModel gpsResponceModelFromJson(String str) =>
    GpsResponceModel.fromJson(json.decode(str));

String gpsResponceModelToJson(GpsResponceModel data) =>
    json.encode(data.toJson());

class GpsResponceModel {
  GpsResponceModel({
    this.allLastLocation,
  });

  List<AllLastLocation> allLastLocation;

  factory GpsResponceModel.fromJson(Map<String, dynamic> json) =>
      GpsResponceModel(
        allLastLocation: List<AllLastLocation>.from(
            json["AllLastLocation"].map((x) => AllLastLocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AllLastLocation":
            List<dynamic>.from(allLastLocation.map((x) => x.toJson())),
      };
}

class AllLastLocation {
  AllLastLocation({
    this.id,
    this.imei,
    this.fuel,
    this.ignition,
    this.ac,
    this.pwrStat,
    this.rlyStat,
    this.battPt,
    this.temperature,
    this.isshort,
    this.recorddate,
    this.createdDate,
    this.latitute,
    this.longitude,
    this.date,
    this.time,
    this.speed,
    this.isfuel,
    this.vehName,
    this.degree,
    this.trackerDate,
  });

  String id;
  String imei;
  int fuel;
  Ac ignition;
  Ac ac;
  Ac pwrStat;
  Ac rlyStat;
  String battPt;
  int temperature;
  bool isshort;
  DateTime recorddate;
  DateTime createdDate;
  String latitute;
  String longitude;
  Date date;
  String time;
  String speed;
  bool isfuel;
  String vehName;
  int degree;
  DateTime trackerDate;

  factory AllLastLocation.fromJson(Map<String, dynamic> json) =>
      AllLastLocation(
        id: json["_id"],
        imei: json["Imei"],
        fuel: json["fuel"],
        ignition: acValues.map[json["ignition"]],
        ac: acValues.map[json["Ac"]],
        pwrStat: acValues.map[json["PWRStat"]],
        rlyStat: acValues.map[json["RLYStat"]],
        battPt: json["BattPT"],
        temperature: json["Temperature"],
        isshort: json["isshort"],
        recorddate: json["recorddate"] == null
            ? null
            : DateTime.parse(json["recorddate"]),
        createdDate: DateTime.parse(json["created_date"]),
        latitute: json["latitute"],
        longitude: json["longitude"],
        date: dateValues.map[json["date"]],
        time: json["time"],
        speed: json["speed"],
        isfuel: json["isfuel"] == null ? null : json["isfuel"],
        vehName: json["VehName"],
        degree: json["Degree"] == null ? null : json["Degree"],
        trackerDate: json["tracker_date"] == null
            ? null
            : DateTime.parse(json["tracker_date"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Imei": imei,
        "fuel": fuel,
        "ignition": acValues.reverse[ignition],
        "Ac": acValues.reverse[ac],
        "PWRStat": acValues.reverse[pwrStat],
        "RLYStat": acValues.reverse[rlyStat],
        "BattPT": battPt,
        "Temperature": temperature,
        "isshort": isshort,
        "recorddate": recorddate == null ? null : recorddate.toIso8601String(),
        "created_date": createdDate.toIso8601String(),
        "latitute": latitute,
        "longitude": longitude,
        "date": dateValues.reverse[date],
        "time": time,
        "speed": speed,
        "isfuel": isfuel == null ? null : isfuel,
        "VehName": vehName,
        "Degree": degree == null ? null : degree,
        "tracker_date":
            trackerDate == null ? null : trackerDate.toIso8601String(),
      };
}

enum Ac { A, B }

final acValues = EnumValues({"A": Ac.A, "B": Ac.B});

enum Date { THE_05112020, THE_04112020 }

final dateValues = EnumValues(
    {"04-11-2020": Date.THE_04112020, "05-11-2020": Date.THE_05112020});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
