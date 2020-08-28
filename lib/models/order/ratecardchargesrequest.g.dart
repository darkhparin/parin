// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratecardchargesrequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratecardchargesrequest _$RatecardchargesrequestFromJson(
    Map<String, dynamic> json) {
  return Ratecardchargesrequest()
    ..ratecardId = json['ratecardId'] as num
    ..isDefault = json['isDefault'] as bool
    ..oPACard_Id = json['oPACard_Id'] as num
    ..oDACard_Id = json['oDACard_Id'] as num
    ..opadistance = json['opadistance'] as num
    ..odadistance = json['odadistance'] as num
    ..serviceTypeId = json['serviceTypeId'] as num
    ..transportAsId = json['transportAsId'] as num
    ..bookingBranchId = json['bookingBranchId'] as num
    ..deliveryBranchId = json['deliveryBranchId'] as num;
}

Map<String, dynamic> _$RatecardchargesrequestToJson(
        Ratecardchargesrequest instance) =>
    <String, dynamic>{
      'ratecardId': instance.ratecardId,
      'isDefault': instance.isDefault,
      'oPACard_Id': instance.oPACard_Id,
      'oDACard_Id': instance.oDACard_Id,
      'opadistance': instance.opadistance,
      'odadistance': instance.odadistance,
      'serviceTypeId': instance.serviceTypeId,
      'transportAsId': instance.transportAsId,
      'bookingBranchId': instance.bookingBranchId,
      'deliveryBranchId': instance.deliveryBranchId
    };
