// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderlinerequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderlinerequest _$OrderlinerequestFromJson(Map<String, dynamic> json) {
  return Orderlinerequest()
    ..serviceTypeId = json['serviceTypeId'] as num
    ..productTypeId = json['productTypeId'] as num
    ..packageTypeId = json['packageTypeId'] as num
    ..shapeId = json['shapeId'] as num
    ..volumeFector = json['volumeFector'] as num
    ..rate = json['rate'] as num
    ..qty = json['qty'] as num
    ..actualweight = json['actualweight'] as num
    ..oLength = json['oLength'] as num
    ..oWidth = json['oWidth'] as num
    ..oHeight = json['oHeight'] as num
    ..dimentionMode = json['dimentionMode'] as num
    ..privateMark = json['privateMark'] as String;
}

Map<String, dynamic> _$OrderlinerequestToJson(Orderlinerequest instance) =>
    <String, dynamic>{
      'serviceTypeId': instance.serviceTypeId,
      'productTypeId': instance.productTypeId,
      'packageTypeId': instance.packageTypeId,
      'shapeId': instance.shapeId,
      'volumeFector': instance.volumeFector,
      'rate': instance.rate,
      'qty': instance.qty,
      'actualweight': instance.actualweight,
      'oLength': instance.oLength,
      'oWidth': instance.oWidth,
      'oHeight': instance.oHeight,
      'dimentionMode': instance.dimentionMode,
      'privateMark': instance.privateMark
    };
