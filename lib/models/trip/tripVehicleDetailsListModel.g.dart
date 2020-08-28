// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripVehicleDetailsListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripVehicleDetailsListModel _$TripVehicleDetailsListModelFromJson(List json) {
  return TripVehicleDetailsListModel()
    ..vehicledetails = json
        ?.map((e) => e == null
            ? null
            : TripVehicleDetailsModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripVehicleDetailsListModelToJson(
        TripVehicleDetailsListModel instance) =>
    <String, dynamic>{'vehicledetails': instance.vehicledetails};
