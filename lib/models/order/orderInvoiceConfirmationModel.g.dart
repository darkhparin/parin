// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderInvoiceConfirmationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderInvoiceConfirmationModel _$OrderInvoiceConfirmationModelFromJson(
    Map<String, dynamic> json) {
  return OrderInvoiceConfirmationModel()
    ..orderId = json['orderId'] as num
    ..partyName = json['partyName'] as String
    ..mobile = json['mobile'] as String
    ..email = json['email'] as String
    ..hasEmailAlert = json['hasEmailAlert'] as bool
    ..hasSmsAlert = json['hasSmsAlert'] as bool
    ..igst = json['igst'] as num
    ..sgst = json['sgst'] as num
    ..cgst = json['cgst'] as num
    ..amount = json['amount'] as num;
}

Map<String, dynamic> _$OrderInvoiceConfirmationModelToJson(
        OrderInvoiceConfirmationModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'partyName': instance.partyName,
      'mobile': instance.mobile,
      'email': instance.email,
      'hasEmailAlert': instance.hasEmailAlert,
      'hasSmsAlert': instance.hasSmsAlert,
      'igst': instance.igst,
      'sgst': instance.sgst,
      'cgst': instance.cgst,
      'amount': instance.amount
    };
