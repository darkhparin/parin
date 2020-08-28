// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripResourceRateCardChargesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripResourceRateCardChargesModel _$TripResourceRateCardChargesModelFromJson(
    Map<String, dynamic> json) {
  return TripResourceRateCardChargesModel()
    ..rateCharges_Id = json['rateCharges_Id'] as num
    ..rate = json['rate'] as num
    ..from_Branch = json['from_Branch'] as String
    ..to_Branch = json['to_Branch'] as String
    ..fromBranch_Id = json['fromBranch_Id'] as num
    ..toBranch_Id = json['toBranch_Id'] as num
    ..divisionRatio = json['divisionRatio'] as num
    ..duration = json['duration'] as num
    ..minRate = json['minRate'] as num
    ..maxRate = json['maxRate'] as num
    ..isDeleted = json['isDeleted'] as bool;
}

Map<String, dynamic> _$TripResourceRateCardChargesModelToJson(
        TripResourceRateCardChargesModel instance) =>
    <String, dynamic>{
      'rateCharges_Id': instance.rateCharges_Id,
      'rate': instance.rate,
      'from_Branch': instance.from_Branch,
      'to_Branch': instance.to_Branch,
      'fromBranch_Id': instance.fromBranch_Id,
      'toBranch_Id': instance.toBranch_Id,
      'divisionRatio': instance.divisionRatio,
      'duration': instance.duration,
      'minRate': instance.minRate,
      'maxRate': instance.maxRate,
      'isDeleted': instance.isDeleted
    };
