import 'package:json_annotation/json_annotation.dart';
import "tripResourceRateCardChargesModel.dart";
part 'tripResourceRateCardModel.g.dart';

@JsonSerializable()
class TripResourceRateCardModel {
    TripResourceRateCardModel();

    num rateCard_Id;
    String rateCard_Name;
    num resourceType_Id;
    String resourceType;
    num service_Id;
    String service;
    num vehicleTypeId;
    String vehicleType;
    num vehicle_Id;
    String vehicle_Name;
    bool isActive;
    num rateCardType_Id;
    String rateCardType;
    String resourceTypeName;
    String rateCardTypeName;
    List<TripResourceRateCardChargesModel> rateCardCharges;
    
    factory TripResourceRateCardModel.fromJson(Map<String,dynamic> json) => _$TripResourceRateCardModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripResourceRateCardModelToJson(this);
}
