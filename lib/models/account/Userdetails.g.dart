// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Userdetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userdetails _$UserdetailsFromJson(Map<String, dynamic> json) {
  return Userdetails()
    ..userId = json['userId'] as num
    ..deviceId = json['deviceId'] as String
    ..deviceTypeId = json['deviceTypeId'] as num
    ..name = json['name'] as String
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..userType = json['userType'] as String
    ..userTypeId = json['userTypeId'] as num
    ..employeeId = json['employeeId'] as num;
}

Map<String, dynamic> _$UserdetailsToJson(Userdetails instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'deviceTypeId': instance.deviceTypeId,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userType': instance.userType,
      'userTypeId': instance.userTypeId,
      'employeeId': instance.employeeId
    };
