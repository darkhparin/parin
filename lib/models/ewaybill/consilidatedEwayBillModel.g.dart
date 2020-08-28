// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consilidatedEwayBillModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsilidatedEwayBillModel _$ConsilidatedEwayBillModelFromJson(
    Map<String, dynamic> json) {
  return ConsilidatedEwayBillModel()
    ..docketNo = json['docketNo'] as String
    ..ewayBillNo = json['ewayBillNo'] as num
    ..ewayBillDate = json['ewayBillDate'] as String
    ..ewayBillValidUpto = json['ewayBillValidUpto'] as String
    ..from = json['from'] as String
    ..to = json['to'] as String
    ..consignee = json['consignee'] as String
    ..invoiceNo = json['invoiceNo'] as String
    ..totalInvoiceValue = json['totalInvoiceValue'] as num
    ..ewayBillStatus = json['ewayBillStatus'] as String;
}

Map<String, dynamic> _$ConsilidatedEwayBillModelToJson(
        ConsilidatedEwayBillModel instance) =>
    <String, dynamic>{
      'docketNo': instance.docketNo,
      'ewayBillNo': instance.ewayBillNo,
      'ewayBillDate': instance.ewayBillDate,
      'ewayBillValidUpto': instance.ewayBillValidUpto,
      'from': instance.from,
      'to': instance.to,
      'consignee': instance.consignee,
      'invoiceNo': instance.invoiceNo,
      'totalInvoiceValue': instance.totalInvoiceValue,
      'ewayBillStatus': instance.ewayBillStatus
    };
