// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratecardcharges.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratecardcharges _$RatecardchargesFromJson(Map<String, dynamic> json) {
  return Ratecardcharges()
    ..rateCardChargesId = json['rateCardChargesId'] as num
    ..rateCardId = json['rateCardId'] as num
    ..type = json['type'] as String
    ..typeId = json['typeId'] as num
    ..rate = json['rate'] as num
    ..fromUnit = json['fromUnit'] as num
    ..toUnit = json['toUnit'] as num
    ..vehicleType = json['vehicleType'] as String
    ..vehicleTypeId = json['vehicleTypeId'] as num
    ..vehicleTypeVisibility = json['vehicleTypeVisibility'] as String
    ..transitDays = json['transitDays'] as num
    ..fromBranch_Id = json['fromBranch_Id'] as num
    ..toBranch_Id = json['toBranch_Id'] as num
    ..fromBranch = json['fromBranch'] as String
    ..toBranch = json['toBranch'] as String
    ..defaultRateChargesId = json['defaultRateChargesId'] as num;
}

Map<String, dynamic> _$RatecardchargesToJson(Ratecardcharges instance) =>
    <String, dynamic>{
      'rateCardChargesId': instance.rateCardChargesId,
      'rateCardId': instance.rateCardId,
      'type': instance.type,
      'typeId': instance.typeId,
      'rate': instance.rate,
      'fromUnit': instance.fromUnit,
      'toUnit': instance.toUnit,
      'vehicleType': instance.vehicleType,
      'vehicleTypeId': instance.vehicleTypeId,
      'vehicleTypeVisibility': instance.vehicleTypeVisibility,
      'transitDays': instance.transitDays,
      'fromBranch_Id': instance.fromBranch_Id,
      'toBranch_Id': instance.toBranch_Id,
      'fromBranch': instance.fromBranch,
      'toBranch': instance.toBranch,
      'defaultRateChargesId': instance.defaultRateChargesId
    };
