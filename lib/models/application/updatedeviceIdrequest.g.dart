// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updatedeviceIdrequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatedeviceIdrequest _$UpdatedeviceIdrequestFromJson(
    Map<String, dynamic> json) {
  return UpdatedeviceIdrequest()
    ..userId = json['userId'] as num
    ..deviceId = json['deviceId'] as String
    ..deviceTypeId = json['deviceTypeId'] as num
    ..otp = json['otp'] as num;
}

Map<String, dynamic> _$UpdatedeviceIdrequestToJson(
        UpdatedeviceIdrequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'deviceTypeId': instance.deviceTypeId,
      'otp': instance.otp
    };
