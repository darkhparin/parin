// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partyLocationDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartyLocationDetailsModel _$PartyLocationDetailsModelFromJson(
    Map<String, dynamic> json) {
  return PartyLocationDetailsModel()
    ..state = json['state'] == null
        ? null
        : Commonmodel.fromJson(json['state'] as Map<String, dynamic>)
    ..city = json['city'] == null
        ? null
        : Commonmodel.fromJson(json['city'] as Map<String, dynamic>)
    ..cityAreas = (json['cityAreas'] as List)
        ?.map((e) =>
            e == null ? null : Commonmodel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PartyLocationDetailsModelToJson(
        PartyLocationDetailsModel instance) =>
    <String, dynamic>{
      'state': instance.state,
      'city': instance.city,
      'cityAreas': instance.cityAreas
    };
