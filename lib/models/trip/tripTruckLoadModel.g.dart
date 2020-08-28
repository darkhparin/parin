// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripTruckLoadModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripTruckLoadModel _$TripTruckLoadModelFromJson(Map<String, dynamic> json) {
  return TripTruckLoadModel()
    ..id = json['id'] as num
    ..loadType_Id = json['loadType_Id'] as num
    ..loadType = json['loadType'] as String
    ..sequenceNr = json['sequenceNr'] as num
    ..code = json['code'] as String
    ..fromBranch_Id = json['fromBranch_Id'] as num
    ..toBranch_Id = json['toBranch_Id'] as num
    ..fromBranch = json['fromBranch'] as String
    ..toBranch = json['toBranch'] as String
    ..bookingBranch = json['bookingBranch'] as String
    ..deliveryBranch = json['deliveryBranch'] as String
    ..status_Id = json['status_Id'] as num
    ..status = json['status'] as String
    ..isDamaged = json['isDamaged'] as bool
    ..damagedQty = json['damagedQty'] as num
    ..qty = json['qty'] as num
    ..productType = json['productType'] as String
    ..packageType = json['packageType'] as String
    ..weight = json['weight'] as num
    ..tripRoute_Id = json['tripRoute_Id'] as num
    ..canUnplan = json['canUnplan'] as bool
    ..canReceive = json['canReceive'] as bool
    ..serviceTypeId = json['serviceTypeId'] as num
    ..serviceType = json['serviceType'] as String
    ..vehicleNo = json['vehicleNo'] as String
    ..vehicleId = json['vehicleId'] as num
    ..tripName = json['tripName'] as String
    ..unplanVisibility = json['unplanVisibility'] as String
    ..receiveVisibility = json['receiveVisibility'] as String;
}

Map<String, dynamic> _$TripTruckLoadModelToJson(TripTruckLoadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loadType_Id': instance.loadType_Id,
      'loadType': instance.loadType,
      'sequenceNr': instance.sequenceNr,
      'code': instance.code,
      'fromBranch_Id': instance.fromBranch_Id,
      'toBranch_Id': instance.toBranch_Id,
      'fromBranch': instance.fromBranch,
      'toBranch': instance.toBranch,
      'bookingBranch': instance.bookingBranch,
      'deliveryBranch': instance.deliveryBranch,
      'status_Id': instance.status_Id,
      'status': instance.status,
      'isDamaged': instance.isDamaged,
      'damagedQty': instance.damagedQty,
      'qty': instance.qty,
      'productType': instance.productType,
      'packageType': instance.packageType,
      'weight': instance.weight,
      'tripRoute_Id': instance.tripRoute_Id,
      'canUnplan': instance.canUnplan,
      'canReceive': instance.canReceive,
      'serviceTypeId': instance.serviceTypeId,
      'serviceType': instance.serviceType,
      'vehicleNo': instance.vehicleNo,
      'vehicleId': instance.vehicleId,
      'tripName': instance.tripName,
      'unplanVisibility': instance.unplanVisibility,
      'receiveVisibility': instance.receiveVisibility
    };
