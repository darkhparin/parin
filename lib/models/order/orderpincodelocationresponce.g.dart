// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderpincodelocationresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderpincodelocationresponce _$OrderpincodelocationresponceFromJson(
    Map<String, dynamic> json) {
  return Orderpincodelocationresponce()
    ..id = json['id'] as num
    ..address = json['address'] as String
    ..street = json['street'] as String
    ..postalCode = json['postalCode'] as String
    ..state_Id = json['state_Id'] as num
    ..state = json['state'] as String
    ..city_Id = json['city_Id'] as num
    ..city = json['city'] as String
    ..cityArea_Id = json['cityArea_Id'] as num
    ..cityArea = json['cityArea'] as String;
}

Map<String, dynamic> _$OrderpincodelocationresponceToJson(
        Orderpincodelocationresponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'street': instance.street,
      'postalCode': instance.postalCode,
      'state_Id': instance.state_Id,
      'state': instance.state,
      'city_Id': instance.city_Id,
      'city': instance.city,
      'cityArea_Id': instance.cityArea_Id,
      'cityArea': instance.cityArea
    };
