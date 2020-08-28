// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripTruckLoadModelList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripTruckLoadModelList _$TripTruckLoadModelListFromJson(List json) {
  return TripTruckLoadModelList()
    ..truckloads = json
        ?.map((e) => e == null
            ? null
            : TripTruckLoadModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripTruckLoadModelListToJson(
        TripTruckLoadModelList instance) =>
    <String, dynamic>{'truckloads': instance.truckloads};
