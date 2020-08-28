// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Loginresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginresponce _$LoginresponceFromJson(Map<String, dynamic> json) {
  return Loginresponce()
    ..access_Token = json['access_Token'] as String
    ..userName = json['userName'] as String
    ..token_Type = json['token_Type'] as String
    ..expires_in = json['expires_in'] as num;
}

Map<String, dynamic> _$LoginresponceToJson(Loginresponce instance) =>
    <String, dynamic>{
      'access_Token': instance.access_Token,
      'userName': instance.userName,
      'token_Type': instance.token_Type,
      'expires_in': instance.expires_in
    };
