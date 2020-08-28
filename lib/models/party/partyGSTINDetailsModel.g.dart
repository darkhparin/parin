// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partyGSTINDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartyGSTINDetailsModel _$PartyGSTINDetailsModelFromJson(
    Map<String, dynamic> json) {
  return PartyGSTINDetailsModel()
    ..gstin = json['gstin'] as String
    ..gstStateId = json['gstStateId'] as num
    ..gstState = json['gstState'] as String
    ..partyName = json['partyName'] as String
    ..address = json['address'] as String
    ..pincode = json['pincode'] as num
    ..isLocalGSTIN = json['isLocalGSTIN'] as bool;
}

Map<String, dynamic> _$PartyGSTINDetailsModelToJson(
        PartyGSTINDetailsModel instance) =>
    <String, dynamic>{
      'gstin': instance.gstin,
      'gstStateId': instance.gstStateId,
      'gstState': instance.gstState,
      'partyName': instance.partyName,
      'address': instance.address,
      'pincode': instance.pincode,
      'isLocalGSTIN': instance.isLocalGSTIN
    };
