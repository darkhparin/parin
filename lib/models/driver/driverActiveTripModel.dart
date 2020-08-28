import 'package:cwl/models/application/latLongModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'driverActiveTripModel.g.dart';

@JsonSerializable()
class DriverActiveTripModel {
  DriverActiveTripModel();

  num tripId;
  String tripName;
  bool isUpTrip;
  String fromBranch;
  num fromBranchId;
  String toBranch;
  num toBranchId;
  bool isContainerBody;
  num serviceTypeId;
  String serviceType;
  LatLongModel fromLocation;
  LatLongModel toLocation;

  factory DriverActiveTripModel.fromJson(Map<String, dynamic> json) =>
      _$DriverActiveTripModelFromJson(json);
  Map<String, dynamic> toJson() => _$DriverActiveTripModelToJson(this);
}
