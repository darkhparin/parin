// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripDriverRateCardListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDriverRateCardListModel _$TripDriverRateCardListModelFromJson(List json) {
  return TripDriverRateCardListModel()
    ..driverratecards = json
        ?.map((e) => e == null
            ? null
            : TripDriverRateCardModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripDriverRateCardListModelToJson(
        TripDriverRateCardListModel instance) =>
    <String, dynamic>{'driverratecards': instance.driverratecards};
