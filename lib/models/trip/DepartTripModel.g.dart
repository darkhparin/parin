// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DepartTripModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartTripModel _$DepartTripModelFromJson(Map<String, dynamic> json) {
  return DepartTripModel()
    ..tripId = json['tripId'] as num
    ..sealNo = json['sealNo'] as String
    ..reading = json['reading'] as num;
}

Map<String, dynamic> _$DepartTripModelToJson(DepartTripModel instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'sealNo': instance.sealNo,
      'reading': instance.reading
    };
