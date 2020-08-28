// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewaybillcorelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ewaybillcorelist _$EwaybillcorelistFromJson(List json) {
  return Ewaybillcorelist()
    ..ewaybillcorelist = (json)
        ?.map((e) =>
            e == null ? null : Ewaybillcore.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$EwaybillcorelistToJson(Ewaybillcorelist instance) =>
    <String, dynamic>{'ewaybillcorelist': instance.ewaybillcorelist};
