// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewaybillextendrequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ewaybillextendrequest _$EwaybillextendrequestFromJson(
    Map<String, dynamic> json) {
  return Ewaybillextendrequest()
    ..eway_bill_number = json['eway_bill_number'] as num
    ..vehicle_number = json['vehicle_number'] as String
    ..remaining_distance = json['remaining_distance'] as num
    ..extend_validity_reason = json['extend_validity_reason'] as String
    ..extend_remarks = json['extend_remarks'] as String
    ..consignment_status = json['consignment_status'] as String
    ..transit_type = json['transit_type'] as String
    ..address_line1 = json['address_line1'] as String
    ..address_line2 = json['address_line2'] as String
    ..address_line3 = json['address_line3'] as String;
}

Map<String, dynamic> _$EwaybillextendrequestToJson(
        Ewaybillextendrequest instance) =>
    <String, dynamic>{
      'eway_bill_number': instance.eway_bill_number,
      'vehicle_number': instance.vehicle_number,
      'remaining_distance': instance.remaining_distance,
      'extend_validity_reason': instance.extend_validity_reason,
      'extend_remarks': instance.extend_remarks,
      'consignment_status': instance.consignment_status,
      'transit_type': instance.transit_type,
      'address_line1': instance.address_line1,
      'address_line2': instance.address_line2,
      'address_line3': instance.address_line3
    };
