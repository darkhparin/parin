// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripVehicleAutoFillModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripVehicleAutoFillModel _$TripVehicleAutoFillModelFromJson(
    Map<String, dynamic> json) {
  return TripVehicleAutoFillModel()
    ..vehicle_Id = json['vehicle_Id'] as num
    ..vehicle_Number = json['vehicle_Number'] as String
    ..isSelectable = json['isSelectable'] as bool
    ..tripNo = json['tripNo'] as String
    ..vehicleType = json['vehicleType'] as String;
}

Map<String, dynamic> _$TripVehicleAutoFillModelToJson(
        TripVehicleAutoFillModel instance) =>
    <String, dynamic>{
      'vehicle_Id': instance.vehicle_Id,
      'vehicle_Number': instance.vehicle_Number,
      'isSelectable': instance.isSelectable,
      'tripNo': instance.tripNo,
      'vehicleType': instance.vehicleType
    };
