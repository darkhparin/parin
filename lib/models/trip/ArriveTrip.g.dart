// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArriveTrip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArriveTrip _$ArriveTripFromJson(Map<String, dynamic> json) {
  return ArriveTrip()
    ..tripId = json['tripId'] as num
    ..unSealNo = json['unSealNo'] as String
    ..reading = json['reading'] as num;
}

Map<String, dynamic> _$ArriveTripToJson(ArriveTrip instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'unSealNo': instance.unSealNo,
      'reading': instance.reading
    };
