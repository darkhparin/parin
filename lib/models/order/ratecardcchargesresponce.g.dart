// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratecardcchargesresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratecardcchargesresponce _$RatecardcchargesresponceFromJson(
    Map<String, dynamic> json) {
  return Ratecardcchargesresponce()
    ..company_Cost = json['company_Cost'] as num
    ..company_Margin_Act = json['company_Margin_Act'] as num
    ..company_Margin = json['company_Margin'] as num
    ..company_FinalRate = json['company_FinalRate'] as num
    ..rateCardCharges = (json['rateCardCharges'] as List)
        ?.map((e) => e == null
            ? null
            : Ratecardcharges.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..opaCardCharges = (json['opaCardCharges'] as List)
        ?.map((e) =>
            e == null ? null : Opdacharges.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..odaCardCharges = (json['odaCardCharges'] as List)
        ?.map((e) =>
            e == null ? null : Opdacharges.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RatecardcchargesresponceToJson(
        Ratecardcchargesresponce instance) =>
    <String, dynamic>{
      'company_Cost': instance.company_Cost,
      'company_Margin_Act': instance.company_Margin_Act,
      'company_Margin': instance.company_Margin,
      'company_FinalRate': instance.company_FinalRate,
      'rateCardCharges': instance.rateCardCharges,
      'opaCardCharges': instance.opaCardCharges,
      'odaCardCharges': instance.odaCardCharges
    };
