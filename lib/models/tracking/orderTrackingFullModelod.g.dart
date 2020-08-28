// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderTrackingFullModelod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderTrackingFullModelod _$OrderTrackingFullModelodFromJson(
    Map<String, dynamic> json) {
  return OrderTrackingFullModelod()
    ..documentName = json['documentName'] as String
    ..fileName = json['fileName'] as String
    ..fileDate = json['fileDate'] as String
    ..documentId = json['documentId'] as num;
}

Map<String, dynamic> _$OrderTrackingFullModelodToJson(
        OrderTrackingFullModelod instance) =>
    <String, dynamic>{
      'documentName': instance.documentName,
      'fileName': instance.fileName,
      'fileDate': instance.fileDate,
      'documentId': instance.documentId
    };
