// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratecardresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratecardresponce _$RatecardresponceFromJson(Map<String, dynamic> json) {
  return Ratecardresponce()
    ..partyRateCardTypeId = json['partyRateCardTypeId'] as num
    ..partyRateCardId = json['partyRateCardId'] as num
    ..rateCardId = json['rateCardId'] as num
    ..rateCardName = json['rateCardName'] as String
    ..rateCardType = json['rateCardType'] as String
    ..defaultStatus = json['defaultStatus'] as String
    ..defaultStatusColor = json['defaultStatusColor'] as String
    ..isDefault = json['isDefault'] as bool
    ..activeStatus = json['activeStatus'] as String
    ..activeStatusColor = json['activeStatusColor'] as String
    ..validStatus = json['validStatus'] as String
    ..validStatusColor = json['validStatusColor'] as String
    ..docket = json['docket'] as num
    ..fod = json['fod'] as num
    ..cod = json['cod'] as num
    ..fov = json['fov'] as num
    ..pod = json['pod'] as num
    ..dacc = json['dacc'] as num
    ..minAirCharge = json['minAirCharge'] as num
    ..minSurfaceCharge = json['minSurfaceCharge'] as num
    ..minRailCharge = json['minRailCharge'] as num
    ..fuelSurcharge = json['fuelSurcharge'] as num
    ..codPercentage = json['codPercentage'] as num
    ..daccPercentage = json['daccPercentage'] as num
    ..volumeFactor = json['volumeFactor'] as num
    ..baseFuelRate = json['baseFuelRate'] as num
    ..surchargeRatio = json['surchargeRatio'] as num
    ..ceillinglimit = json['ceillinglimit'] as num
    ..railFuelSurcharge = json['railFuelSurcharge'] as num
    ..airFuelSurcharge = json['airFuelSurcharge'] as num
    ..demurrageHours = json['demurrageHours'] as num
    ..demurrageRate = json['demurrageRate'] as num
    ..isRateCardCharesAvilable = json['isRateCardCharesAvilable'] as bool
    ..fromBranch = json['fromBranch'] as String
    ..toBranch = json['toBranch'] as String
    ..opaDistance = json['opaDistance'] as num
    ..odaDistance = json['odaDistance'] as num
    ..opaCard_Id = json['opaCard_Id'] as num
    ..odaCard_Id = json['odaCard_Id'] as num
    ..isSurfaceWeightPerDocket = json['isSurfaceWeightPerDocket'] as bool
    ..isAirWeightPerDocket = json['isAirWeightPerDocket'] as bool
    ..isRailWeightPerDocket = json['isRailWeightPerDocket'] as bool
    ..isSelectable = json['isSelectable'] as bool
    ..miscCharge = json['miscCharge'] as num
    ..loadingCharges = json['loadingCharges'] as num
    ..unLoadingcharges = json['unLoadingcharges'] as num
    ..validTill = json['validTill'] as String;
}

Map<String, dynamic> _$RatecardresponceToJson(Ratecardresponce instance) =>
    <String, dynamic>{
      'partyRateCardTypeId': instance.partyRateCardTypeId,
      'partyRateCardId': instance.partyRateCardId,
      'rateCardId': instance.rateCardId,
      'rateCardName': instance.rateCardName,
      'rateCardType': instance.rateCardType,
      'defaultStatus': instance.defaultStatus,
      'defaultStatusColor': instance.defaultStatusColor,
      'isDefault': instance.isDefault,
      'activeStatus': instance.activeStatus,
      'activeStatusColor': instance.activeStatusColor,
      'validStatus': instance.validStatus,
      'validStatusColor': instance.validStatusColor,
      'docket': instance.docket,
      'fod': instance.fod,
      'cod': instance.cod,
      'fov': instance.fov,
      'pod': instance.pod,
      'dacc': instance.dacc,
      'minAirCharge': instance.minAirCharge,
      'minSurfaceCharge': instance.minSurfaceCharge,
      'minRailCharge': instance.minRailCharge,
      'fuelSurcharge': instance.fuelSurcharge,
      'codPercentage': instance.codPercentage,
      'daccPercentage': instance.daccPercentage,
      'volumeFactor': instance.volumeFactor,
      'baseFuelRate': instance.baseFuelRate,
      'surchargeRatio': instance.surchargeRatio,
      'ceillinglimit': instance.ceillinglimit,
      'railFuelSurcharge': instance.railFuelSurcharge,
      'airFuelSurcharge': instance.airFuelSurcharge,
      'demurrageHours': instance.demurrageHours,
      'demurrageRate': instance.demurrageRate,
      'isRateCardCharesAvilable': instance.isRateCardCharesAvilable,
      'fromBranch': instance.fromBranch,
      'toBranch': instance.toBranch,
      'opaDistance': instance.opaDistance,
      'odaDistance': instance.odaDistance,
      'opaCard_Id': instance.opaCard_Id,
      'odaCard_Id': instance.odaCard_Id,
      'isSurfaceWeightPerDocket': instance.isSurfaceWeightPerDocket,
      'isAirWeightPerDocket': instance.isAirWeightPerDocket,
      'isRailWeightPerDocket': instance.isRailWeightPerDocket,
      'isSelectable': instance.isSelectable,
      'miscCharge': instance.miscCharge,
      'loadingCharges': instance.loadingCharges,
      'unLoadingcharges': instance.unLoadingcharges,
      'validTill': instance.validTill
    };
