// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opdacharges.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Opdacharges _$OpdachargesFromJson(Map<String, dynamic> json) {
  return Opdacharges()
    ..chargeId = json['chargeId'] as num
    ..cardId = json['cardId'] as num
    ..fromDistance = json['fromDistance'] as num
    ..toDistance = json['toDistance'] as num
    ..minWeight = json['minWeight'] as num
    ..maxWeight = json['maxWeight'] as num
    ..charge = json['charge'] as num;
}

Map<String, dynamic> _$OpdachargesToJson(Opdacharges instance) =>
    <String, dynamic>{
      'chargeId': instance.chargeId,
      'cardId': instance.cardId,
      'fromDistance': instance.fromDistance,
      'toDistance': instance.toDistance,
      'minWeight': instance.minWeight,
      'maxWeight': instance.maxWeight,
      'charge': instance.charge
    };
