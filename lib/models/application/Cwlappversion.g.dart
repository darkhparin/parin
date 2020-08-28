// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cwlappversion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cwlappversion _$CwlappversionFromJson(Map<String, dynamic> json) {
  return Cwlappversion()
    ..id = json['id'] as num
    ..version = json['version'] as num
    ..versionName = json['versionName'] as String;
}

Map<String, dynamic> _$CwlappversionToJson(Cwlappversion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'versionName': instance.versionName
    };
