// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ODASlabModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ODASlabModel _$ODASlabModelFromJson(Map<String, dynamic> json) {
  return ODASlabModel()
    ..distnaceStartIndex = json['distnaceStartIndex'] as num
    ..distanceEndIndex = json['distanceEndIndex'] as num
    ..weightStartIndex = json['weightStartIndex'] as num
    ..weightEndIndex = json['weightEndIndex'] as num
    ..charge = json['charge'] as num;
}

Map<String, dynamic> _$ODASlabModelToJson(ODASlabModel instance) =>
    <String, dynamic>{
      'distnaceStartIndex': instance.distnaceStartIndex,
      'distanceEndIndex': instance.distanceEndIndex,
      'weightStartIndex': instance.weightStartIndex,
      'weightEndIndex': instance.weightEndIndex,
      'charge': instance.charge
    };
