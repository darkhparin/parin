// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateTripLocaion_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTripLocaion_request_model _$UpdateTripLocaion_request_modelFromJson(
    Map<String, dynamic> json) {
  return UpdateTripLocaion_request_model()
    ..tripId = json['tripId'] as num
    ..latitude = json['latitude'] as num
    ..longitude = json['longitude'] as num;
}

Map<String, dynamic> _$UpdateTripLocaion_request_modelToJson(
        UpdateTripLocaion_request_model instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };
