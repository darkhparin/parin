// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripResourceRateCardRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripResourceRateCardRequestModel _$TripResourceRateCardRequestModelFromJson(
    Map<String, dynamic> json) {
  return TripResourceRateCardRequestModel()
    ..fromBranchId = json['fromBranchId'] as num
    ..toBranchId = json['toBranchId'] as num
    ..resourceTypeId = json['resourceTypeId'] as num
    ..resourceId = json['resourceId'] as num
    ..serviceId = json['serviceId'] as num
    ..vehicleId = json['vehicleId'] as num
    ..brokerRateTypeName = json['brokerRateTypeName'] as String;
}

Map<String, dynamic> _$TripResourceRateCardRequestModelToJson(
        TripResourceRateCardRequestModel instance) =>
    <String, dynamic>{
      'fromBranchId': instance.fromBranchId,
      'toBranchId': instance.toBranchId,
      'resourceTypeId': instance.resourceTypeId,
      'resourceId': instance.resourceId,
      'serviceId': instance.serviceId,
      'vehicleId': instance.vehicleId,
      'brokerRateTypeName': instance.brokerRateTypeName
    };
