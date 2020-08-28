// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extendableewaybills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Extendableewaybills _$ExtendableewaybillsFromJson(List json) {
  return Extendableewaybills()
    ..ewaybills = (json)
        ?.map((e) => e == null
            ? null
            : Extendableewaybill.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ExtendableewaybillsToJson(
        Extendableewaybills instance) =>
    <String, dynamic>{'ewaybills': instance.ewaybills};
