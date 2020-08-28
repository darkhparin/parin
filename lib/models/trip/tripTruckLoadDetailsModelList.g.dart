// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripTruckLoadDetailsModelList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripTruckLoadDetailsModelList _$TripTruckLoadDetailsModelListFromJson(
    List json) {
  return TripTruckLoadDetailsModelList()
    ..truckloaddetails = json
        ?.map((e) => e == null
            ? null
            : TripTruckLoadDetailsModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripTruckLoadDetailsModelListToJson(
        TripTruckLoadDetailsModelList instance) =>
    <String, dynamic>{'truckloaddetails': instance.truckloaddetails};
