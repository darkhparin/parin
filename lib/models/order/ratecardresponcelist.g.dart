// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratecardresponcelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratecardresponcelist _$RatecardresponcelistFromJson(List json) {
  return Ratecardresponcelist()
    ..ratecardlist = (json)
        ?.map((e) => e == null
            ? null
            : Ratecardresponce.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RatecardresponcelistToJson(
        Ratecardresponcelist instance) =>
    <String, dynamic>{'ratecardlist': instance.ratecardlist};
