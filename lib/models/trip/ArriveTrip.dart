import 'package:json_annotation/json_annotation.dart';

part 'ArriveTrip.g.dart';

@JsonSerializable()
class ArriveTrip {
  ArriveTrip();

  num tripId;
  String unSealNo;
  num reading;

  factory ArriveTrip.fromJson(Map<String, dynamic> json) =>
      _$ArriveTripFromJson(json);
  Map<String, dynamic> toJson() => _$ArriveTripToJson(this);
}
