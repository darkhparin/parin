// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registerEmployeeRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterEmployeeRequest _$RegisterEmployeeRequestFromJson(
    Map<String, dynamic> json) {
  return RegisterEmployeeRequest()
    ..userName = json['userName'] as String
    ..password = json['password'] as String
    ..mobileNo = json['mobileNo'] as String
    ..email = json['email'] as String
    ..deviceId = json['deviceId'] as String
    ..deviceTypeId = json['deviceTypeId'] as num;
}

Map<String, dynamic> _$RegisterEmployeeRequestToJson(
        RegisterEmployeeRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'mobileNo': instance.mobileNo,
      'email': instance.email,
      'deviceId': instance.deviceId,
      'deviceTypeId': instance.deviceTypeId
    };
