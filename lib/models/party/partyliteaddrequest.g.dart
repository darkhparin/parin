// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partyliteaddrequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Partyliteaddrequest _$PartyliteaddrequestFromJson(Map<String, dynamic> json) {
  return Partyliteaddrequest()
    ..branchId = json['branchId'] as num
    ..partyname = json['partyname'] as String
    ..productTypeId = json['productTypeId'] as num
    ..marketingPersonId = json['marketingPersonId'] as num
    ..gstin = json['gstin'] as String
    ..address = json['address'] as String
    ..pincode = json['pincode'] as num
    ..stateId = json['stateId'] as num
    ..cityId = json['cityId'] as num
    ..cityAreaId = json['cityAreaId'] as num
    ..contactPerson = json['contactPerson'] as String
    ..phoneM = json['phoneM'] as String
    ..phoneO = json['phoneO'] as String
    ..pickupTypeId = json['pickupTypeId'] as num
    ..deliveryTypeId = json['deliveryTypeId'] as num
    ..employeeId = json['employeeId'] as num
    ..userId = json['userId'] as num;
}

Map<String, dynamic> _$PartyliteaddrequestToJson(
        Partyliteaddrequest instance) =>
    <String, dynamic>{
      'branchId': instance.branchId,
      'partyname': instance.partyname,
      'productTypeId': instance.productTypeId,
      'marketingPersonId': instance.marketingPersonId,
      'gstin': instance.gstin,
      'address': instance.address,
      'pincode': instance.pincode,
      'stateId': instance.stateId,
      'cityId': instance.cityId,
      'cityAreaId': instance.cityAreaId,
      'contactPerson': instance.contactPerson,
      'phoneM': instance.phoneM,
      'phoneO': instance.phoneO,
      'pickupTypeId': instance.pickupTypeId,
      'deliveryTypeId': instance.deliveryTypeId,
      'employeeId': instance.employeeId,
      'userId': instance.userId
    };
