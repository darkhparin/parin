// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripVehicleDriverModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripVehicleDriverModel _$TripVehicleDriverModelFromJson(
    Map<String, dynamic> json) {
  return TripVehicleDriverModel()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..phone_M = json['phone_M'] as String
    ..phone_M2 = json['phone_M2'] as String
    ..licenseNr = json['licenseNr'] as String
    ..licenseExpireOn = json['licenseExpireOn'] as String
    ..lincesePlace = json['lincesePlace'] as String
    ..licenseIssuedOn = json['licenseIssuedOn'] as String
    ..isDeleted = json['isDeleted'] as bool
    ..isOwned = json['isOwned'] as bool
    ..isActive = json['isActive'] as bool;
}

Map<String, dynamic> _$TripVehicleDriverModelToJson(
        TripVehicleDriverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_M': instance.phone_M,
      'phone_M2': instance.phone_M2,
      'licenseNr': instance.licenseNr,
      'licenseExpireOn': instance.licenseExpireOn,
      'lincesePlace': instance.lincesePlace,
      'licenseIssuedOn': instance.licenseIssuedOn,
      'isDeleted': instance.isDeleted,
      'isOwned': instance.isOwned,
      'isActive': instance.isActive
    };
