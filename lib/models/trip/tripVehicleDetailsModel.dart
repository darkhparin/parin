import 'package:json_annotation/json_annotation.dart';
import "tripVehicleDriverModel.dart";
part 'tripVehicleDetailsModel.g.dart';

@JsonSerializable()
class TripVehicleDetailsModel {
    TripVehicleDetailsModel();

    num vehicle_Id;
    String vehicle_Number;
    String permitExpireOn;
    String insuranceNr;
    String insuranceDate;
    String insuranceValidUpto;
    num modelYear;
    num modelMonth;
    bool isOwned;
    String financeInfo;
    String taxNr;
    String taxDate;
    String taxValidUpto;
    num maxCapacity;
    bool isActive;
    bool isDeleted;
    String color;
    String registrationDate;
    String chasisNr;
    String engineNr;
    String fitnessValidity;
    String ownerName;
    String ownerAddress;
    String ownerPhone;
    String ownerPanCard;
    num permitType_Id;
    String permitType;
    num insuranceCompany_Id;
    String insuranceCompany;
    num vehicleType_Id;
    String vehicleType;
    String broker;
    num broker_Id;
    bool isVendor;
    num branch_Id;
    String branch;
    num bodyType_Id;
    String bodyType;
    List<TripVehicleDriverModel> drivers;
    
    factory TripVehicleDetailsModel.fromJson(Map<String,dynamic> json) => _$TripVehicleDetailsModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripVehicleDetailsModelToJson(this);
}
