// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allEwayBill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllEwayBill _$AllEwayBillFromJson(Map<String, dynamic> json) {
  return AllEwayBill()
    ..ewayBillId = json['ewayBillId'] as num
    ..ewayBillNo = json['ewayBillNo'] as num
    ..ewayBillDate = json['ewayBillDate'] as String
    ..ewayBillValidTill = json['ewayBillValidTill'] as String
    ..consignorGSTIN = json['consignorGSTIN'] as String
    ..consignorPincode = json['consignorPincode'] as num
    ..consignor = json['consignor'] as String
    ..consigneeGSTIN = json['consigneeGSTIN'] as String
    ..consigneePincode = json['consigneePincode'] as num
    ..consignee = json['consignee'] as String
    ..total_invoice_value = json['total_invoice_value'] as num
    ..document_number = json['document_number'] as String
    ..hasErrors = json['hasErrors'] as bool
    ..errors = json['errors'] as List;
}

Map<String, dynamic> _$AllEwayBillToJson(AllEwayBill instance) =>
    <String, dynamic>{
      'ewayBillId': instance.ewayBillId,
      'ewayBillNo': instance.ewayBillNo,
      'ewayBillDate': instance.ewayBillDate,
      'ewayBillValidTill': instance.ewayBillValidTill,
      'consignorGSTIN': instance.consignorGSTIN,
      'consignorPincode': instance.consignorPincode,
      'consignor': instance.consignor,
      'consigneeGSTIN': instance.consigneeGSTIN,
      'consigneePincode': instance.consigneePincode,
      'consignee': instance.consignee,
      'total_invoice_value': instance.total_invoice_value,
      'document_number': instance.document_number,
      'hasErrors': instance.hasErrors,
      'errors': instance.errors
    };
