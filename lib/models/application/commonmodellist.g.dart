// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commonmodellist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commonmodellist _$CommonmodellistFromJson(List json) {
  return Commonmodellist()
    ..commonlist = (json)
        ?.map((e) =>
            e == null ? null : Commonmodel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CommonmodellistToJson(Commonmodellist instance) =>
    <String, dynamic>{'commonlist': instance.commonlist};
