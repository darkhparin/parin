// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripServiceTypeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripServiceTypeModel _$TripServiceTypeModelFromJson(Map<String, dynamic> json) {
  return TripServiceTypeModel()
    ..serviceTypeId = json['serviceTypeId'] as num
    ..serviceType = json['serviceType'] as String;
}

Map<String, dynamic> _$TripServiceTypeModelToJson(
        TripServiceTypeModel instance) =>
    <String, dynamic>{
      'serviceTypeId': instance.serviceTypeId,
      'serviceType': instance.serviceType
    };
