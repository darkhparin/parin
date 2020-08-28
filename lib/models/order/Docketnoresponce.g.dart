// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Docketnoresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Docketnoresponce _$DocketnoresponceFromJson(Map<String, dynamic> json) {
  return Docketnoresponce()
    ..docketNo = json['docketNo'] as String
    ..currentFuelRate = json['currentFuelRate'] as num
    ..isBookingBranchServiceable = json['isBookingBranchServiceable'] as bool
    ..isBookingBranchHasBookingRight =
        json['isBookingBranchHasBookingRight'] as bool
    ..bookingBranchId = json['bookingBranchId'] as num
    ..bookingBranch = json['bookingBranch'] as String
    ..companyId = json['companyId'] as num
    ..bookingPincode = json['bookingPincode'] as num
    ..vendor = json['vendor'] == null
        ? null
        : Commonmodel.fromJson(json['vendor'] as Map<String, dynamic>)
    ..vendorList = (json['vendorList'] as List)
        ?.map((e) =>
            e == null ? null : Commonmodel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$DocketnoresponceToJson(Docketnoresponce instance) =>
    <String, dynamic>{
      'docketNo': instance.docketNo,
      'currentFuelRate': instance.currentFuelRate,
      'isBookingBranchServiceable': instance.isBookingBranchServiceable,
      'isBookingBranchHasBookingRight': instance.isBookingBranchHasBookingRight,
      'bookingBranchId': instance.bookingBranchId,
      'bookingBranch': instance.bookingBranch,
      'companyId': instance.companyId,
      'bookingPincode': instance.bookingPincode,
      'vendor': instance.vendor,
      'vendorList': instance.vendorList
    };
