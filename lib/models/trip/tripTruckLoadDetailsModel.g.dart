// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripTruckLoadDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripTruckLoadDetailsModel _$TripTruckLoadDetailsModelFromJson(
    Map<String, dynamic> json) {
  return TripTruckLoadDetailsModel()
    ..loadTypeId = json['loadTypeId'] as num
    ..loadType = json['loadType'] as String
    ..code = json['code'] as String
    ..id = json['id'] as num
    ..bookingDate = json['bookingDate'] as String
    ..bookingBranch = json['bookingBranch'] as String
    ..deliveryBranch = json['deliveryBranch'] as String
    ..sourceBranch = json['sourceBranch'] as String
    ..toID = json['toID'] as num
    ..destinationBranch = json['destinationBranch'] as String
    ..status = json['status'] as String
    ..packageType = json['packageType'] as String
    ..productType = json['productType'] as String
    ..weight = json['weight'] as num
    ..qty = json['qty'] as num
    ..serviceName = json['serviceName'] as String
    ..serviceId = json['serviceId'] as num
    ..isTranship = json['isTranship'] as bool
    ..remark = json['remark'] as String
    ..isAck = json['isAck'] as bool;
}

Map<String, dynamic> _$TripTruckLoadDetailsModelToJson(
        TripTruckLoadDetailsModel instance) =>
    <String, dynamic>{
      'loadTypeId': instance.loadTypeId,
      'loadType': instance.loadType,
      'code': instance.code,
      'id': instance.id,
      'bookingDate': instance.bookingDate,
      'bookingBranch': instance.bookingBranch,
      'deliveryBranch': instance.deliveryBranch,
      'sourceBranch': instance.sourceBranch,
      'toID': instance.toID,
      'destinationBranch': instance.destinationBranch,
      'status': instance.status,
      'packageType': instance.packageType,
      'productType': instance.productType,
      'weight': instance.weight,
      'qty': instance.qty,
      'serviceName': instance.serviceName,
      'serviceId': instance.serviceId,
      'isTranship': instance.isTranship,
      'remark': instance.remark,
      'isAck': instance.isAck
    };
