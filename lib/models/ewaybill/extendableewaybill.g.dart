// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extendableewaybill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Extendableewaybill _$ExtendableewaybillFromJson(Map<String, dynamic> json) {
  return Extendableewaybill()
    ..ewayBillId = json['ewayBillId'] as num
    ..docketNo = json['docketNo'] as String
    ..fromBranch = json['fromBranch'] as String
    ..toBranch = json['toBranch'] as String
    ..status = json['status'] as String
    ..ewbNo = json['ewbNo'] as num
    ..createdOn = json['createdOn'] as String
    ..validTill = json['validTill'] as String
    ..validDays = json['validDays'] as num
    ..extendedTimes = json['extendedTimes'] as num
    ..expireIn = json['expireIn'] as num;
}

Map<String, dynamic> _$ExtendableewaybillToJson(Extendableewaybill instance) =>
    <String, dynamic>{
      'ewayBillId': instance.ewayBillId,
      'docketNo': instance.docketNo,
      'fromBranch': instance.fromBranch,
      'toBranch': instance.toBranch,
      'status': instance.status,
      'ewbNo': instance.ewbNo,
      'createdOn': instance.createdOn,
      'validTill': instance.validTill,
      'validDays': instance.validDays,
      'extendedTimes': instance.extendedTimes,
      'expireIn': instance.expireIn
    };
