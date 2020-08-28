// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripSaveRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripSaveRequestModel _$TripSaveRequestModelFromJson(Map<String, dynamic> json) {
  return TripSaveRequestModel()
    ..id = json['id'] as num
    ..hireCharge = json['hireCharge'] as num
    ..ratePerKM = json['ratePerKM'] as num
    ..executedBy = json['executedBy'] as num
    ..isFixedRate = json['isFixedRate'] as bool
    ..referenceNo = json['referenceNo'] as String
    ..service_Id = json['service_Id'] as num
    ..fromBranch_Id = json['fromBranch_Id'] as num
    ..toBranch_Id = json['toBranch_Id'] as num
    ..trackingStatus_Id = json['trackingStatus_Id'] as num
    ..plane_Id = json['plane_Id'] as num
    ..train_Id = json['train_Id'] as num
    ..truck_Id = json['truck_Id'] as num
    ..broker_Id = json['broker_Id'] as num
    ..driver_Id = json['driver_Id'] as num
    ..driver2_Id = json['driver2_Id'] as num
    ..vendorRateId = json['vendorRateId'] as num
    ..poNumber = json['poNumber'] as String
    ..rateCardId = json['rateCardId'] as num
    ..rateTypeId = json['rateTypeId'] as num
    ..ratePerKg = json['ratePerKg'] as num
    ..driverBrokerRateCardId = json['driverBrokerRateCardId'] as num
    ..expectedDuration = json['expectedDuration'] as num
    ..divisionRatio = json['divisionRatio'] as num;
}

Map<String, dynamic> _$TripSaveRequestModelToJson(
        TripSaveRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hireCharge': instance.hireCharge,
      'ratePerKM': instance.ratePerKM,
      'executedBy': instance.executedBy,
      'isFixedRate': instance.isFixedRate,
      'referenceNo': instance.referenceNo,
      'service_Id': instance.service_Id,
      'fromBranch_Id': instance.fromBranch_Id,
      'toBranch_Id': instance.toBranch_Id,
      'trackingStatus_Id': instance.trackingStatus_Id,
      'plane_Id': instance.plane_Id,
      'train_Id': instance.train_Id,
      'truck_Id': instance.truck_Id,
      'broker_Id': instance.broker_Id,
      'driver_Id': instance.driver_Id,
      'driver2_Id': instance.driver2_Id,
      'vendorRateId': instance.vendorRateId,
      'poNumber': instance.poNumber,
      'rateCardId': instance.rateCardId,
      'rateTypeId': instance.rateTypeId,
      'ratePerKg': instance.ratePerKg,
      'driverBrokerRateCardId': instance.driverBrokerRateCardId,
      'expectedDuration': instance.expectedDuration,
      'divisionRatio': instance.divisionRatio
    };
