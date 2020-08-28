// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderTrackingFullModelpd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderTrackingFullModelpd _$OrderTrackingFullModelpdFromJson(
    Map<String, dynamic> json) {
  return OrderTrackingFullModelpd()
    ..packetNo = json['packetNo'] as String
    ..packetDate = json['packetDate'] as String
    ..packetStatus = json['packetStatus'] as String
    ..packetAckDate = json['packetAckDate'] as String
    ..podPacketNo = json['podPacketNo'] as String
    ..podPacketDate = json['podPacketDate'] as String
    ..podPacketStatus = json['podPacketStatus'] as String
    ..podPacketAckDate = json['podPacketAckDate'] as String
    ..codPacketNo = json['codPacketNo'] as String
    ..codPacketDate = json['codPacketDate'] as String
    ..codPacketStatus = json['codPacketStatus'] as String
    ..codPacketAckDate = json['codPacketAckDate'] as String;
}

Map<String, dynamic> _$OrderTrackingFullModelpdToJson(
        OrderTrackingFullModelpd instance) =>
    <String, dynamic>{
      'packetNo': instance.packetNo,
      'packetDate': instance.packetDate,
      'packetStatus': instance.packetStatus,
      'packetAckDate': instance.packetAckDate,
      'podPacketNo': instance.podPacketNo,
      'podPacketDate': instance.podPacketDate,
      'podPacketStatus': instance.podPacketStatus,
      'podPacketAckDate': instance.podPacketAckDate,
      'codPacketNo': instance.codPacketNo,
      'codPacketDate': instance.codPacketDate,
      'codPacketStatus': instance.codPacketStatus,
      'codPacketAckDate': instance.codPacketAckDate
    };
