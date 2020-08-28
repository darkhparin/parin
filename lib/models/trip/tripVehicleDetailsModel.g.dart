// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripVehicleDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripVehicleDetailsModel _$TripVehicleDetailsModelFromJson(
    Map<String, dynamic> json) {
  return TripVehicleDetailsModel()
    ..vehicle_Id = json['vehicle_Id'] as num
    ..vehicle_Number = json['vehicle_Number'] as String
    ..permitExpireOn = json['permitExpireOn'] as String
    ..insuranceNr = json['insuranceNr'] as String
    ..insuranceDate = json['insuranceDate'] as String
    ..insuranceValidUpto = json['insuranceValidUpto'] as String
    ..modelYear = json['modelYear'] as num
    ..modelMonth = json['modelMonth'] as num
    ..isOwned = json['isOwned'] as bool
    ..financeInfo = json['financeInfo'] as String
    ..taxNr = json['taxNr'] as String
    ..taxDate = json['taxDate'] as String
    ..taxValidUpto = json['taxValidUpto'] as String
    ..maxCapacity = json['maxCapacity'] as num
    ..isActive = json['isActive'] as bool
    ..isDeleted = json['isDeleted'] as bool
    ..color = json['color'] as String
    ..registrationDate = json['registrationDate'] as String
    ..chasisNr = json['chasisNr'] as String
    ..engineNr = json['engineNr'] as String
    ..fitnessValidity = json['fitnessValidity'] as String
    ..ownerName = json['ownerName'] as String
    ..ownerAddress = json['ownerAddress'] as String
    ..ownerPhone = json['ownerPhone'] as String
    ..ownerPanCard = json['ownerPanCard'] as String
    ..permitType_Id = json['permitType_Id'] as num
    ..permitType = json['permitType'] as String
    ..insuranceCompany_Id = json['insuranceCompany_Id'] as num
    ..insuranceCompany = json['insuranceCompany'] as String
    ..vehicleType_Id = json['vehicleType_Id'] as num
    ..vehicleType = json['vehicleType'] as String
    ..broker = json['broker'] as String
    ..broker_Id = json['broker_Id'] as num
    ..isVendor = json['isVendor'] as bool
    ..branch_Id = json['branch_Id'] as num
    ..branch = json['branch'] as String
    ..bodyType_Id = json['bodyType_Id'] as num
    ..bodyType = json['bodyType'] as String
    ..drivers = (json['drivers'] as List)
        ?.map((e) => e == null
            ? null
            : TripVehicleDriverModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripVehicleDetailsModelToJson(
        TripVehicleDetailsModel instance) =>
    <String, dynamic>{
      'vehicle_Id': instance.vehicle_Id,
      'vehicle_Number': instance.vehicle_Number,
      'permitExpireOn': instance.permitExpireOn,
      'insuranceNr': instance.insuranceNr,
      'insuranceDate': instance.insuranceDate,
      'insuranceValidUpto': instance.insuranceValidUpto,
      'modelYear': instance.modelYear,
      'modelMonth': instance.modelMonth,
      'isOwned': instance.isOwned,
      'financeInfo': instance.financeInfo,
      'taxNr': instance.taxNr,
      'taxDate': instance.taxDate,
      'taxValidUpto': instance.taxValidUpto,
      'maxCapacity': instance.maxCapacity,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'color': instance.color,
      'registrationDate': instance.registrationDate,
      'chasisNr': instance.chasisNr,
      'engineNr': instance.engineNr,
      'fitnessValidity': instance.fitnessValidity,
      'ownerName': instance.ownerName,
      'ownerAddress': instance.ownerAddress,
      'ownerPhone': instance.ownerPhone,
      'ownerPanCard': instance.ownerPanCard,
      'permitType_Id': instance.permitType_Id,
      'permitType': instance.permitType,
      'insuranceCompany_Id': instance.insuranceCompany_Id,
      'insuranceCompany': instance.insuranceCompany,
      'vehicleType_Id': instance.vehicleType_Id,
      'vehicleType': instance.vehicleType,
      'broker': instance.broker,
      'broker_Id': instance.broker_Id,
      'isVendor': instance.isVendor,
      'branch_Id': instance.branch_Id,
      'branch': instance.branch,
      'bodyType_Id': instance.bodyType_Id,
      'bodyType': instance.bodyType,
      'drivers': instance.drivers
    };
