import 'package:cwl/models/application/latLongModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tripDetailsModel.g.dart';

@JsonSerializable()
class TripDetailsModel {
  TripDetailsModel();

  num id;
  String tcvlhc;
  String mode;
  num modeId;
  String origin;
  String destination;
  String lastLocation;
  String lastLocationDate;
  String lastLocationAddress;
  String date;
  String currentTrip;
  String carrier;
  String resource;
  String status;
  num tripId;
  String planButtonVisibility;
  String originTime;
  String destinationTime;
  bool isUpTrip;
  String isUpTripIconVisisbility;
  String isUpTripIcon;
  String isUpTripIconColor;
  String actionColor;
  bool canCreateDownTrip;
  String modeIcon;
  String modeIconColor;
  String ltVisibility;
  bool isContainerBody;
  LatLongModel fromLocation;
  LatLongModel toLocation;
  LatLongModel currentLocation;

  num latitude;
  num longitude;
  String addressnew;

  factory TripDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TripDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripDetailsModelToJson(this);
}
