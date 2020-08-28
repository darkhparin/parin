// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shapemodellist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shapemodellist _$ShapemodellistFromJson(List json) {
  return Shapemodellist()
    ..shapelist = (json)
        ?.map((e) =>
            e == null ? null : Shapemodel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ShapemodellistToJson(Shapemodellist instance) =>
    <String, dynamic>{'shapelist': instance.shapelist};
