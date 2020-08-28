// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripVehicleAutoFillListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripVehicleAutoFillListModel _$TripVehicleAutoFillListModelFromJson(List json) {
  return TripVehicleAutoFillListModel()
    ..vehicles = json
        ?.map((e) => e == null
            ? null
            : TripVehicleAutoFillModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripVehicleAutoFillListModelToJson(
        TripVehicleAutoFillListModel instance) =>
    <String, dynamic>{'vehicles': instance.vehicles};
