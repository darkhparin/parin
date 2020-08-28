// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripResourceRateCardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripResourceRateCardModel _$TripResourceRateCardModelFromJson(
    Map<String, dynamic> json) {
  return TripResourceRateCardModel()
    ..rateCard_Id = json['rateCard_Id'] as num
    ..rateCard_Name = json['rateCard_Name'] as String
    ..resourceType_Id = json['resourceType_Id'] as num
    ..resourceType = json['resourceType'] as String
    ..service_Id = json['service_Id'] as num
    ..service = json['service'] as String
    ..vehicleTypeId = json['vehicleTypeId'] as num
    ..vehicleType = json['vehicleType'] as String
    ..vehicle_Id = json['vehicle_Id'] as num
    ..vehicle_Name = json['vehicle_Name'] as String
    ..isActive = json['isActive'] as bool
    ..rateCardType_Id = json['rateCardType_Id'] as num
    ..rateCardType = json['rateCardType'] as String
    ..resourceTypeName = json['resourceTypeName'] as String
    ..rateCardTypeName = json['rateCardTypeName'] as String
    ..rateCardCharges = (json['rateCardCharges'] as List)
        ?.map((e) => e == null
            ? null
            : TripResourceRateCardChargesModel.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripResourceRateCardModelToJson(
        TripResourceRateCardModel instance) =>
    <String, dynamic>{
      'rateCard_Id': instance.rateCard_Id,
      'rateCard_Name': instance.rateCard_Name,
      'resourceType_Id': instance.resourceType_Id,
      'resourceType': instance.resourceType,
      'service_Id': instance.service_Id,
      'service': instance.service,
      'vehicleTypeId': instance.vehicleTypeId,
      'vehicleType': instance.vehicleType,
      'vehicle_Id': instance.vehicle_Id,
      'vehicle_Name': instance.vehicle_Name,
      'isActive': instance.isActive,
      'rateCardType_Id': instance.rateCardType_Id,
      'rateCardType': instance.rateCardType,
      'resourceTypeName': instance.resourceTypeName,
      'rateCardTypeName': instance.rateCardTypeName,
      'rateCardCharges': instance.rateCardCharges
    };
