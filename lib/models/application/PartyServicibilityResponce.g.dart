// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PartyServicibilityResponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartyServicibilityResponce _$PartyServicibilityResponceFromJson(
    Map<String, dynamic> json) {
  return PartyServicibilityResponce()
    ..pincode = json['pincode'] as String
    ..isServicible = json['isServicible'] as bool
    ..branch = json['branch'] as String
    ..distance = json['distance'] as num
    ..isoda = json['isoda'] as bool
    ..odaSlab = (json['odaSlab'] as List)
        ?.map((e) =>
            e == null ? null : ODASlabModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PartyServicibilityResponceToJson(
        PartyServicibilityResponce instance) =>
    <String, dynamic>{
      'pincode': instance.pincode,
      'isServicible': instance.isServicible,
      'branch': instance.branch,
      'distance': instance.distance,
      'isoda': instance.isoda,
      'odaSlab': instance.odaSlab
    };
