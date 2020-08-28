// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ewaybillrequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ewaybillrequest _$EwaybillrequestFromJson(Map<String, dynamic> json) {
  return Ewaybillrequest()
    ..ewayBills = json['ewayBills'] as List
    ..bookingBranchId = json['bookingBranchId'] as num
    ..deliveryPincode = json['deliveryPincode'] as num;
}

Map<String, dynamic> _$EwaybillrequestToJson(Ewaybillrequest instance) =>
    <String, dynamic>{
      'ewayBills': instance.ewayBills,
      'bookingBranchId': instance.bookingBranchId,
      'deliveryPincode': instance.deliveryPincode
    };
