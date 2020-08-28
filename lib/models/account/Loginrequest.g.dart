// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Loginrequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginrequest _$LoginrequestFromJson(Map<String, dynamic> json) {
  return Loginrequest()
    ..userName = json['userName'] as String
    ..password = json['password'] as String
    ..deviceType = json['deviceType'] as num
    ..deviceIds = json['deviceIds'] as List;
}

Map<String, dynamic> _$LoginrequestToJson(Loginrequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password.replaceAll('\"', ''),
      'deviceType': instance.deviceType,
      'deviceIds': instance.deviceIds
    };
