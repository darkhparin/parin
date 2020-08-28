// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripDriverRateCardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDriverRateCardModel _$TripDriverRateCardModelFromJson(
    Map<String, dynamic> json) {
  return TripDriverRateCardModel()
    ..driverRateCard_Id = json['driverRateCard_Id'] as num
    ..rateCard = json['rateCard'] == null
        ? null
        : TripResourceRateCardModel.fromJson(
            json['rateCard'] as Map<String, dynamic>)
    ..fromDate = json['fromDate'] as String
    ..toDate = json['toDate'] as String
    ..fuelSurcharge = json['fuelSurcharge'] as num
    ..basicDieselRate = json['basicDieselRate'] as num
    ..surchargeRatio = json['surchargeRatio'] as num
    ..ceilingLimit = json['ceilingLimit'] as num
    ..isCeiling = json['isCeiling'] as bool
    ..validated = json['validated'] as bool
    ..validatedOn = json['validatedOn'] as String
    ..validatedBy = json['validatedBy'] as String;
}

Map<String, dynamic> _$TripDriverRateCardModelToJson(
        TripDriverRateCardModel instance) =>
    <String, dynamic>{
      'driverRateCard_Id': instance.driverRateCard_Id,
      'rateCard': instance.rateCard,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'fuelSurcharge': instance.fuelSurcharge,
      'basicDieselRate': instance.basicDieselRate,
      'surchargeRatio': instance.surchargeRatio,
      'ceilingLimit': instance.ceilingLimit,
      'isCeiling': instance.isCeiling,
      'validated': instance.validated,
      'validatedOn': instance.validatedOn,
      'validatedBy': instance.validatedBy
    };
