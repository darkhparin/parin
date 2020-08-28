// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripPlanForDriverRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripPlanForDriverRequestModel _$TripPlanForDriverRequestModelFromJson(
    Map<String, dynamic> json) {
  return TripPlanForDriverRequestModel()
    ..tripRouteId = json['tripRouteId'] as num
    ..loadId = json['loadId'] as num
    ..loadTypeId = json['loadTypeId'] as num;
}

Map<String, dynamic> _$TripPlanForDriverRequestModelToJson(
        TripPlanForDriverRequestModel instance) =>
    <String, dynamic>{
      'tripRouteId': instance.tripRouteId,
      'loadId': instance.loadId,
      'loadTypeId': instance.loadTypeId
    };
