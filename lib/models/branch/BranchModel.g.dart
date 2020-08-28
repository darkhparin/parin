// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BranchModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) {
  return BranchModel()
    ..id = json['id'] as num
    ..code = json['code'] as String
    ..name = json['name'] as String
    ..branch = json['branch'] as String
    ..isDepot = json['isDepot'] as bool
    ..openingDate = json['openingDate'] as String
    ..closingDate = json['closingDate'] as String
    ..phone_O = json['phone_O'] as String
    ..phone_M = json['phone_M'] as String
    ..isDeleted = json['isDeleted'] as bool
    ..email = json['email'] as String
    ..isActive = json['isActive'] as bool
    ..isClosed = json['isClosed'] as bool
    ..contactPerson = json['contactPerson'] as String
    ..branchLocation_Id = json['branchLocation_Id'] as num
    ..zone = json['zone'] as String
    ..perKgRate = json['perKgRate'] as num
    ..regionalManager_Id = json['regionalManager_Id'] as num
    ..zonalManager_Id = json['zonalManager_Id'] as num
    ..maxSurfacePercent = json['maxSurfacePercent'] as num
    ..maxAirPercent = json['maxAirPercent'] as num
    ..maxRailPercent = json['maxRailPercent'] as num
    ..maxFTLPercent = json['maxFTLPercent'] as num
    ..demurrageHours = json['demurrageHours'] as num
    ..demurrageRate = json['demurrageRate'] as num
    ..gstCompanyStateId = json['gstCompanyStateId'] as num
    ..latitude = json['latitude'] as num
    ..longitude = json['longitude'] as num
    ..region = json['region'] as String
    ..zoneId = json['zoneId'] as num;
}

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'branch': instance.branch,
      'isDepot': instance.isDepot,
      'openingDate': instance.openingDate,
      'closingDate': instance.closingDate,
      'phone_O': instance.phone_O,
      'phone_M': instance.phone_M,
      'isDeleted': instance.isDeleted,
      'email': instance.email,
      'isActive': instance.isActive,
      'isClosed': instance.isClosed,
      'contactPerson': instance.contactPerson,
      'branchLocation_Id': instance.branchLocation_Id,
      'zone': instance.zone,
      'perKgRate': instance.perKgRate,
      'regionalManager_Id': instance.regionalManager_Id,
      'zonalManager_Id': instance.zonalManager_Id,
      'maxSurfacePercent': instance.maxSurfacePercent,
      'maxAirPercent': instance.maxAirPercent,
      'maxRailPercent': instance.maxRailPercent,
      'maxFTLPercent': instance.maxFTLPercent,
      'demurrageHours': instance.demurrageHours,
      'demurrageRate': instance.demurrageRate,
      'gstCompanyStateId': instance.gstCompanyStateId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'region': instance.region,
      'zoneId': instance.zoneId
    };
