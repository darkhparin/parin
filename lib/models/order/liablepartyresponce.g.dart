// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liablepartyresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Liablepartyresponce _$LiablepartyresponceFromJson(Map<String, dynamic> json) {
  return Liablepartyresponce()
    ..partyId = json['partyId'] as num
    ..name = json['name'] as String
    ..gstNo = json['gstNo'] as String
    ..isValidGSTIN = json['isValidGSTIN'] as bool
    ..creditPeriod = json['creditPeriod'] as num
    ..billingCycleId = json['billingCycleId'] as num
    ..billingCycle = json['billingCycle'] as String
    ..productType = json['productType'] == null
        ? null
        : Producttypeshort.fromJson(json['productType'] as Map<String, dynamic>)
    ..pickupType = json['pickupType'] == null
        ? null
        : PickupTypeshort.fromJson(json['pickupType'] as Map<String, dynamic>)
    ..deliveryType = json['deliveryType'] == null
        ? null
        : DeliveryTypeshort.fromJson(
            json['deliveryType'] as Map<String, dynamic>)
    ..pincodes = (json['pincodes'] as List)
        ?.map((e) =>
            e == null ? null : Pincodeshort.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..marketingPerson =
        json['marketingPerson'] == null ? 0 : json['marketingPerson'] as num;
}

Map<String, dynamic> _$LiablepartyresponceToJson(
        Liablepartyresponce instance) =>
    <String, dynamic>{
      'partyId': instance.partyId,
      'name': instance.name,
      'gstNo': instance.gstNo,
      'isValidGSTIN': instance.isValidGSTIN,
      'creditPeriod': instance.creditPeriod,
      'billingCycleId': instance.billingCycleId,
      'billingCycle': instance.billingCycle,
      'productType': instance.productType,
      'pickupType': instance.pickupType,
      'deliveryType': instance.deliveryType,
      'pincodes': instance.pincodes,
      'marketingPerson': instance.marketingPerson
    };
