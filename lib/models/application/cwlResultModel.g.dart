// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cwlResultModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CwlResultModel _$CwlResultModelFromJson(Map<String, dynamic> json) {
  return CwlResultModel()
    ..id = json['id'] as num
    ..hasError = json['hasError'] as bool
    ..message = json['message'] as String;
}

Map<String, dynamic> _$CwlResultModelToJson(CwlResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hasError': instance.hasError,
      'message': instance.message
    };
