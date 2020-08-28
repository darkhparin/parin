// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratecardrequestmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratecardrequestmodel _$RatecardrequestmodelFromJson(Map<String, dynamic> json) {
  return Ratecardrequestmodel()
    ..userId = json['userId'] as num
    ..bookingDate = json['bookingDate'] as String
    ..bookingBranchId = json['bookingBranchId'] as num
    ..deliveryBranchId = json['deliveryBranchId'] as num
    ..consignorId = json['consignorId'] as num
    ..consigneeId = json['consigneeId'] as num
    ..consignorPincode = json['consignorPincode'] as num
    ..consigneePincode = json['consigneePincode'] as num
    ..paymentPartyId = json['paymentPartyId'] as num
    ..servicetypeId = json['servicetypeId'] as num
    ..paymentModeId = json['paymentModeId'] as num
    ..transportAsId = json['transportAsId'] as num;
}

Map<String, dynamic> _$RatecardrequestmodelToJson(
        Ratecardrequestmodel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'bookingDate': instance.bookingDate,
      'bookingBranchId': instance.bookingBranchId,
      'deliveryBranchId': instance.deliveryBranchId,
      'consignorId': instance.consignorId,
      'consigneeId': instance.consigneeId,
      'consignorPincode': instance.consignorPincode,
      'consigneePincode': instance.consigneePincode,
      'paymentPartyId': instance.paymentPartyId,
      'servicetypeId': instance.servicetypeId,
      'paymentModeId': instance.paymentModeId,
      'transportAsId': instance.transportAsId
    };
