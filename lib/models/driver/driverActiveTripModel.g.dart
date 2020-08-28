// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driverActiveTripModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverActiveTripModel _$DriverActiveTripModelFromJson(
    Map<String, dynamic> json) {
  return DriverActiveTripModel()
    ..tripId = json['tripId'] as num
    ..tripName = json['tripName'] as String
    ..isUpTrip = json['isUpTrip'] as bool
    ..fromBranch = json['fromBranch'] as String
    ..fromBranchId = json['fromBranchId'] as num
    ..toBranch = json['toBranch'] as String
    ..toBranchId = json['toBranchId'] as num
    ..isContainerBody = json['isContainerBody'] as bool
    ..serviceTypeId = json['serviceTypeId'] as num
    ..serviceType = json['serviceType'] as String
    ..fromLocation = json['fromLocation'] == null
        ? null
        : LatLongModel.fromJson(json['fromLocation'] as Map<String, dynamic>)
    ..toLocation = json['toLocation'] == null
        ? null
        : LatLongModel.fromJson(json['toLocation'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DriverActiveTripModelToJson(
        DriverActiveTripModel instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'tripName': instance.tripName,
      'isUpTrip': instance.isUpTrip,
      'fromBranch': instance.fromBranch,
      'fromBranchId': instance.fromBranchId,
      'toBranch': instance.toBranch,
      'toBranchId': instance.toBranchId,
      'isContainerBody': instance.isContainerBody,
      'serviceTypeId': instance.serviceTypeId,
      'serviceType': instance.serviceType,
      'fromLocation': instance.fromLocation,
      'toLocation': instance.toLocation
    };
