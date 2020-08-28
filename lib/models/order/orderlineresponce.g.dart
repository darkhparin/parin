// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderlineresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderlineresponce _$OrderlineresponceFromJson(Map<String, dynamic> json) {
  return Orderlineresponce()
    ..id = json['id'] as num
    ..length = json['length'] as num
    ..width = json['width'] as num
    ..height = json['height'] as num
    ..description = json['description'] as String
    ..qty = json['qty'] as num
    ..actualWeight = json['actualWeight'] as num
    ..chargedWeight = json['chargedWeight'] as num
    ..rate = json['rate'] as num
    ..isDeleted = json['isDeleted'] as bool
    ..volumeFactor = json['volumeFactor'] as num
    ..dimentionMode = json['dimentionMode'] as num
    ..finalCharge = json['finalCharge'] as num
    ..isVolumeBased = json['isVolumeBased'] as bool
    ..order_Id = json['order_Id'] as num
    ..productType_Id = json['productType_Id'] as num
    ..packageType_Id = json['packageType_Id'] as num
    ..privateMark = json['privateMark'] as String
    ..shapeId = json['shapeId'] as num
    ..volumaticWeight = json['volumaticWeight'] as num;
}

Map<String, dynamic> _$OrderlineresponceToJson(Orderlineresponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'description': instance.description,
      'qty': instance.qty,
      'actualWeight': instance.actualWeight,
      'chargedWeight': instance.chargedWeight,
      'rate': instance.rate,
      'isDeleted': instance.isDeleted,
      'volumeFactor': instance.volumeFactor,
      'dimentionMode': instance.dimentionMode,
      'finalCharge': instance.finalCharge,
      'isVolumeBased': instance.isVolumeBased,
      'order_Id': instance.order_Id,
      'productType_Id': instance.productType_Id,
      'packageType_Id': instance.packageType_Id,
      'privateMark': instance.privateMark,
      'shapeId': instance.shapeId,
      'volumaticWeight': instance.volumaticWeight
    };
