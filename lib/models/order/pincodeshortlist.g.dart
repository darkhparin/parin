// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincodeshortlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pincodeshortlist _$PincodeshortlistFromJson(List json) {
  return Pincodeshortlist()
    ..pincodes = (json)
        ?.map((e) =>
            e == null ? null : Pincodeshort.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PincodeshortlistToJson(Pincodeshortlist instance) =>
    <String, dynamic>{'pincodes': instance.pincodes};
