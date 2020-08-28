// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Apiresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apiresponce _$ApiresponceFromJson(Map<String, dynamic> json) {
  return Apiresponce()
    ..error = json['error'] as bool
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ApiresponceToJson(Apiresponce instance) =>
    <String, dynamic>{'error': instance.error, 'message': instance.message};
