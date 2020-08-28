// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderInvocieCreateRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderInvocieCreateRequestModel _$OrderInvocieCreateRequestModelFromJson(
    Map<String, dynamic> json) {
  return OrderInvocieCreateRequestModel()
    ..orderId = json['orderId'] as num
    ..mobile = json['mobile'] as String
    ..email = json['email'] as String
    ..hasEmailAlert = json['hasEmailAlert'] as bool
    ..hasSmsAlert = json['hasSmsAlert'] as bool;
}

Map<String, dynamic> _$OrderInvocieCreateRequestModelToJson(
        OrderInvocieCreateRequestModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'mobile': instance.mobile,
      'email': instance.email,
      'hasEmailAlert': instance.hasEmailAlert,
      'hasSmsAlert': instance.hasSmsAlert
    };
