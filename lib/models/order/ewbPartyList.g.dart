// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ewbPartyList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EwbPartyList _$EwbPartyListFromJson(List json) {
  return EwbPartyList()
    ..parties = json
        ?.map((e) =>
            e == null ? null : EwbParty.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$EwbPartyListToJson(EwbPartyList instance) =>
    <String, dynamic>{'parties': instance.parties};
