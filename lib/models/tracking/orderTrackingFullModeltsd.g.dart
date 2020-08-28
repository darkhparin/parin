// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderTrackingFullModeltsd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderTrackingFullModeltsd _$OrderTrackingFullModeltsdFromJson(
    Map<String, dynamic> json) {
  return OrderTrackingFullModeltsd()
    ..sequenceNr = json['sequenceNr'] as num
    ..fromStation = json['fromStation'] as String
    ..toStation = json['toStation'] as String
    ..dispatchDate = json['dispatchDate'] as String
    ..arrivalDate = json['arrivalDate'] as String
    ..qty = json['qty'] as num
    ..weight = json['weight'] as num
    ..trip = json['trip'] as String
    ..vehicle = json['vehicle'] as String
    ..onHoldHours = json['onHoldHours'] as int;
}

Map<String, dynamic> _$OrderTrackingFullModeltsdToJson(
        OrderTrackingFullModeltsd instance) =>
    <String, dynamic>{
      'sequenceNr': instance.sequenceNr,
      'fromStation': instance.fromStation,
      'toStation': instance.toStation,
      'dispatchDate': instance.dispatchDate,
      'arrivalDate': instance.arrivalDate,
      'qty': instance.qty,
      'weight': instance.weight,
      'trip': instance.trip,
      'vehicle': instance.vehicle,
      'onHoldHours': instance.onHoldHours
    };
