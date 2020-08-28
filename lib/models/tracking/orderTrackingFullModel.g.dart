// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderTrackingFullModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderTrackingFullModel _$OrderTrackingFullModelFromJson(
    Map<String, dynamic> json) {
  return OrderTrackingFullModel()
    ..code = json['code'] as String
    ..isOrder = json['isOrder'] as bool
    ..consignor = json['consignor'] as String
    ..consignee = json['consignee'] as String
    ..mode = json['mode'] as String
    ..paymentMode = json['paymentMode'] as String
    ..qty = json['qty'] as num
    ..weight = json['weight'] as num
    ..totalFreight = json['totalFreight'] as num
    ..expDeliveryDate = json['expDeliveryDate'] as String
    ..bookingRemarks = json['bookingRemarks'] as String
    ..deliveryRemarks = json['deliveryRemarks'] as String
    ..bookingDate = json['bookingDate'] as String
    ..bookingStation = json['bookingStation'] as String
    ..deliveryStation = json['deliveryStation'] as String
    ..dwbStatus = json['dwbStatus'] as String
    ..deliveryDate = json['deliveryDate'] as String
    ..transhipmentDetails = (json['transhipmentDetails'] as List)
        ?.map((e) => e == null
            ? null
            : OrderTrackingFullModeltsd.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..orderDocuments = (json['orderDocuments'] as List)
        ?.map((e) => e == null
            ? null
            : OrderTrackingFullModelod.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..orderPODDocuments = (json['orderPODDocuments'] as List)
        ?.map((e) => e == null
            ? null
            : OrderTrackingFullModelod.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..packetDetails = json['packetDetails'] == null
        ? null
        : OrderTrackingFullModelpd.fromJson(
            json['packetDetails'] as Map<String, dynamic>)
    ..invoiceCode = json['invoiceCode'] as String
    ..invoiceDate = json['invoiceDate'] as String
    ..invoiceStatus = json['invoiceStatus'] as String
    ..receiptNo = json['receiptNo'] as String
    ..sender = json['sender'] as String
    ..recipient = json['recipient'] as String
    ..packetDate = json['packetDate'] as String
    ..fromBranchPacket = json['fromBranchPacket'] as String
    ..toBranchPacket = json['toBranchPacket'] as String
    ..packetStatus = json['packetStatus'] as String
    ..acknowledgeDate = json['acknowledgeDate'] as String
    ..packetDocuments = json['packetDocuments'] as String;
}

Map<String, dynamic> _$OrderTrackingFullModelToJson(
        OrderTrackingFullModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isOrder': instance.isOrder,
      'consignor': instance.consignor,
      'consignee': instance.consignee,
      'mode': instance.mode,
      'paymentMode': instance.paymentMode,
      'qty': instance.qty,
      'weight': instance.weight,
      'totalFreight': instance.totalFreight,
      'expDeliveryDate': instance.expDeliveryDate,
      'bookingRemarks': instance.bookingRemarks,
      'deliveryRemarks': instance.deliveryRemarks,
      'bookingDate': instance.bookingDate,
      'bookingStation': instance.bookingStation,
      'deliveryStation': instance.deliveryStation,
      'dwbStatus': instance.dwbStatus,
      'deliveryDate': instance.deliveryDate,
      'transhipmentDetails': instance.transhipmentDetails,
      'orderDocuments': instance.orderDocuments,
      'orderPODDocuments': instance.orderPODDocuments,
      'packetDetails': instance.packetDetails,
      'invoiceCode': instance.invoiceCode,
      'invoiceDate': instance.invoiceDate,
      'invoiceStatus': instance.invoiceStatus,
      'receiptNo': instance.receiptNo,
      'sender': instance.sender,
      'recipient': instance.recipient,
      'packetDate': instance.packetDate,
      'fromBranchPacket': instance.fromBranchPacket,
      'toBranchPacket': instance.toBranchPacket,
      'packetStatus': instance.packetStatus,
      'acknowledgeDate': instance.acknowledgeDate,
      'packetDocuments': instance.packetDocuments
    };
