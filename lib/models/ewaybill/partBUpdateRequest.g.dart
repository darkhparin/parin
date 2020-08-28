// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partBUpdateRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartBUpdateRequest _$PartBUpdateRequestFromJson(Map<String, dynamic> json) {
  return PartBUpdateRequest()
    ..eway_bill_number = json['eway_bill_number'] as num
    ..vehicle_number = json['vehicle_number'] as String
    ..transporter_document_number =
        json['transporter_document_number'] as String;
}

Map<String, dynamic> _$PartBUpdateRequestToJson(PartBUpdateRequest instance) =>
    <String, dynamic>{
      'eway_bill_number': instance.eway_bill_number,
      'vehicle_number': instance.vehicle_number,
      'transporter_document_number': instance.transporter_document_number
    };
