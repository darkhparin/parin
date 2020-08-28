// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Localcredentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Localcredentials _$LocalcredentialsFromJson(Map<String, dynamic> json) {
  return Localcredentials()
    ..username = json['username'] as String
    ..password = json['password'] as String;
}

Map<String, dynamic> _$LocalcredentialsToJson(Localcredentials instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password
    };
