// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shapemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shapemodel _$ShapemodelFromJson(Map<String, dynamic> json) {
  return Shapemodel()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..isActive = json['isActive'] as bool
    ..seqOrder = json['seqOrder'] as num;
}

Map<String, dynamic> _$ShapemodelToJson(Shapemodel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isActive': instance.isActive,
      'seqOrder': instance.seqOrder
    };
