// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Locationmodel _$LocationmodelFromJson(Map<String, dynamic> json) {
  return Locationmodel()
    ..id = json['id'] as num
    ..address = json['address'] as String
    ..street = json['street'] as String
    ..postalCode = json['postalCode'] as String
    ..state_Id = json['state_Id'] as num
    ..city_Id = json['city_Id'] as num
    ..cityArea_Id = json['cityArea_Id'] as num;
}

Map<String, dynamic> _$LocationmodelToJson(Locationmodel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'street': instance.street,
      'postalCode': instance.postalCode,
      'state_Id': instance.state_Id,
      'city_Id': instance.city_Id,
      'cityArea_Id': instance.cityArea_Id
    };
