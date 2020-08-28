// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Ewaybillresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ewaybillresponce _$EwaybillresponceFromJson(Map<String, dynamic> json) {
  return Ewaybillresponce()
    ..allEwayBills = (json['allEwayBills'] as List)
        ?.map((e) =>
            e == null ? null : Ewaybillcore.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..otherEwayBills = (json['otherEwayBills'] as List)
        ?.map((e) =>
            e == null ? null : Ewaybillcore.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..deliveryBranchId = json['deliveryBranchId'] as num
    ..deliveryBranch = json['deliveryBranch'] as String
    ..deliveryPincode = json['deliveryPincode'] as num
    ..isManualEwayBill = json['isManualEwayBill'] as bool
    ..consignors = (json['consignors'] as List)
        ?.map((e) =>
            e == null ? null : EwbParty.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..consignees = (json['consignees'] as List)
        ?.map((e) =>
            e == null ? null : EwbParty.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..consignor_IsURP = json['consignor_IsURP'] as bool
    ..consignee_IsURP = json['consignee_IsURP'] as bool
    ..docketResponce = json['docketResponce'] == null
        ? null
        : Docketnoresponce.fromJson(
            json['docketResponce'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EwaybillresponceToJson(Ewaybillresponce instance) =>
    <String, dynamic>{
      'allEwayBills': instance.allEwayBills,
      'otherEwayBills': instance.otherEwayBills,
      'deliveryBranchId': instance.deliveryBranchId,
      'deliveryBranch': instance.deliveryBranch,
      'deliveryPincode': instance.deliveryPincode,
      'isManualEwayBill': instance.isManualEwayBill,
      'consignors': instance.consignors,
      'consignees': instance.consignees,
      'consignor_IsURP': instance.consignor_IsURP,
      'consignee_IsURP': instance.consignee_IsURP,
      'docketResponce': instance.docketResponce
    };
