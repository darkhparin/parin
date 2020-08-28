// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripBrockerRateTypeListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripBrockerRateTypeListModel _$TripBrockerRateTypeListModelFromJson(List json) {
  return TripBrockerRateTypeListModel()
    ..ratetypes = json
        ?.map((e) => e == null
            ? null
            : TripBrockerRateTypeModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripBrockerRateTypeListModelToJson(
        TripBrockerRateTypeListModel instance) =>
    <String, dynamic>{'ratetypes': instance.ratetypes};
