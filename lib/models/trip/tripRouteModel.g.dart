// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripRouteModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripRouteModel _$TripRouteModelFromJson(Map<String, dynamic> json) {
  return TripRouteModel()
    ..id = json['id'] as num
    ..tripId = json['tripId'] as num
    ..branchId = json['branchId'] as num
    ..branch = json['branch'] as String
    ..branchColor = json['branchColor'] as String
    ..seqNo = json['seqNo'] as num
    ..seqNoColor = json['seqNoColor'] as String
    ..arrivalTime = json['arrivalTime'] as String
    ..departureTime = json['departureTime'] as String
    ..canPlan = json['canPlan'] as bool
    ..canAddAbove = json['canAddAbove'] as bool
    ..canAddBelove = json['canAddBelove'] as bool
    ..isSelectable = json['isSelectable'] as bool
    ..standBy = json['standBy'] as String
    ..isFirst = json['isFirst'] as bool
    ..isLast = json['isLast'] as bool
    ..sealNo = json['sealNo'] as String
    ..unSealNo = json['unSealNo'] as String
    ..statusId = json['statusId'] as num
    ..status = json['status'] as String
    ..remark = json['remark'] as String
    ..arrivalReading = json['arrivalReading'] as num
    ..isEnable = json['isEnable'] as bool
    ..isEnableConsolidateWaybill = json['isEnableConsolidateWaybill'] as bool
    ..latitude = json['latitude'] as num
    ..longitude = json['longitude'] as num;
}

Map<String, dynamic> _$TripRouteModelToJson(TripRouteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tripId': instance.tripId,
      'branchId': instance.branchId,
      'branch': instance.branch,
      'branchColor': instance.branchColor,
      'seqNo': instance.seqNo,
      'seqNoColor': instance.seqNoColor,
      'arrivalTime': instance.arrivalTime,
      'departureTime': instance.departureTime,
      'canPlan': instance.canPlan,
      'canAddAbove': instance.canAddAbove,
      'canAddBelove': instance.canAddBelove,
      'isSelectable': instance.isSelectable,
      'standBy': instance.standBy,
      'isFirst': instance.isFirst,
      'isLast': instance.isLast,
      'sealNo': instance.sealNo,
      'unSealNo': instance.unSealNo,
      'statusId': instance.statusId,
      'status': instance.status,
      'remark': instance.remark,
      'arrivalReading': instance.arrivalReading,
      'isEnable': instance.isEnable,
      'isEnableConsolidateWaybill': instance.isEnableConsolidateWaybill,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
