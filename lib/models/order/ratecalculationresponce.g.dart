// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratecalculationresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratecalculationresponce _$RatecalculationresponceFromJson(
    Map<String, dynamic> json) {
  return Ratecalculationresponce()
    ..cwlCost = json['cwlCost'] as num
    ..cwlMargin = json['cwlMargin'] as num
    ..rate = json['rate'] as num
    ..actualWeight = json['actualWeight'] as num
    ..totalChargableWeight = json['totalChargableWeight'] as num
    ..totalQty = json['totalQty'] as num
    ..totalActualWeight = json['totalActualWeight'] as num
    ..minmumCharges = json['minmumCharges'] as num
    ..firstFreight = json['firstFreight'] as num
    ..chargableFreight = json['chargableFreight'] as num
    ..fuelSurchargePercent = json['fuelSurchargePercent'] as num
    ..org_FuelSurchargePercent = json['org_FuelSurchargePercent'] as num
    ..fuelSurcharge = json['fuelSurcharge'] as num
    ..docketCharge = json['docketCharge'] as num
    ..org_DocketCharge = json['org_DocketCharge'] as num
    ..podCharge = json['podCharge'] as num
    ..org_PODCharge = json['org_PODCharge'] as num
    ..fodCharge = json['fodCharge'] as num
    ..fovPercentage = json['fovPercentage'] as num
    ..org_FOVPercentage = json['org_FOVPercentage'] as num
    ..fovCharge = json['fovCharge'] as num
    ..org_FOVCharge = json['org_FOVCharge'] as num
    ..hasCOD = json['hasCOD'] as bool
    ..hasDACC = json['hasDACC'] as bool
    ..daccCharge = json['daccCharge'] as num
    ..daccRemark = json['daccRemark'] as String
    ..daccPercentage = json['daccPercentage'] as num
    ..codCharge = json['codCharge'] as num
    ..codValue = json['codValue'] as num
    ..codPercent = json['codPercent'] as num
    ..opaCharge = json['opaCharge'] as num
    ..odaCharge = json['odaCharge'] as num
    ..org_OPACharge = json['org_OPACharge'] as num
    ..org_ODACharge = json['org_ODACharge'] as num
    ..miscCharge = json['miscCharge'] as num
    ..org_MiscCharge = json['org_MiscCharge'] as num
    ..loadingCharges = json['loadingCharges'] as num
    ..unLoadingCharges = json['unLoadingCharges'] as num
    ..org_LoadingCharges = json['org_LoadingCharges'] as num
    ..org_UnLoadingCharges = json['org_UnLoadingCharges'] as num
    ..costExcludingTax = json['costExcludingTax'] as num
    ..igst = json['igst'] as num
    ..ugst = json['ugst'] as num
    ..cgst = json['cgst'] as num
    ..sgst = json['sgst'] as num
    ..totalCharge = json['totalCharge'] as num
    ..rateCardCharges = json['rateCardCharges'] == null
        ? null
        : Ratecardcharges.fromJson(
            json['rateCardCharges'] as Map<String, dynamic>)
    ..gstPercent = json['gstPercent'] == null
        ? null
        : Ratecalulationgstpercent.fromJson(
            json['gstPercent'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RatecalculationresponceToJson(
        Ratecalculationresponce instance) =>
    <String, dynamic>{
      'cwlCost': instance.cwlCost,
      'cwlMargin': instance.cwlMargin,
      'rate': instance.rate,
      'actualWeight': instance.actualWeight,
      'totalChargableWeight': instance.totalChargableWeight,
      'totalQty': instance.totalQty,
      'totalActualWeight': instance.totalActualWeight,
      'minmumCharges': instance.minmumCharges,
      'firstFreight': instance.firstFreight,
      'chargableFreight': instance.chargableFreight,
      'fuelSurchargePercent': instance.fuelSurchargePercent,
      'org_FuelSurchargePercent': instance.org_FuelSurchargePercent,
      'fuelSurcharge': instance.fuelSurcharge,
      'docketCharge': instance.docketCharge,
      'org_DocketCharge': instance.org_DocketCharge,
      'podCharge': instance.podCharge,
      'org_PODCharge': instance.org_PODCharge,
      'fodCharge': instance.fodCharge,
      'fovPercentage': instance.fovPercentage,
      'org_FOVPercentage': instance.org_FOVPercentage,
      'fovCharge': instance.fovCharge,
      'org_FOVCharge': instance.org_FOVCharge,
      'hasCOD': instance.hasCOD,
      'hasDACC': instance.hasDACC,
      'daccCharge': instance.daccCharge,
      'daccRemark': instance.daccRemark,
      'daccPercentage': instance.daccPercentage,
      'codCharge': instance.codCharge,
      'codValue': instance.codValue,
      'codPercent': instance.codPercent,
      'opaCharge': instance.opaCharge,
      'odaCharge': instance.odaCharge,
      'org_OPACharge': instance.org_OPACharge,
      'org_ODACharge': instance.org_ODACharge,
      'miscCharge': instance.miscCharge,
      'org_MiscCharge': instance.org_MiscCharge,
      'loadingCharges': instance.loadingCharges,
      'unLoadingCharges': instance.unLoadingCharges,
      'org_LoadingCharges': instance.org_LoadingCharges,
      'org_UnLoadingCharges': instance.org_UnLoadingCharges,
      'costExcludingTax': instance.costExcludingTax,
      'igst': instance.igst,
      'ugst': instance.ugst,
      'cgst': instance.cgst,
      'sgst': instance.sgst,
      'totalCharge': instance.totalCharge,
      'rateCardCharges': instance.rateCardCharges,
      'gstPercent': instance.gstPercent
    };
