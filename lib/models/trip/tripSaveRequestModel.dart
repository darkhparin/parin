import 'package:json_annotation/json_annotation.dart';

part 'tripSaveRequestModel.g.dart';

@JsonSerializable()
class TripSaveRequestModel {
    TripSaveRequestModel();

    num id;
    num hireCharge;
    num ratePerKM;
    num executedBy;
    bool isFixedRate;
    String referenceNo;
    num service_Id;
    num fromBranch_Id;
    num toBranch_Id;
    num trackingStatus_Id;
    num plane_Id;
    num train_Id;
    num truck_Id;
    num broker_Id;
    num driver_Id;
    num driver2_Id;
    num vendorRateId;
    String poNumber;
    num rateCardId;
    num rateTypeId;
    num ratePerKg;
    num driverBrokerRateCardId;
    num expectedDuration;
    num divisionRatio;
    
    factory TripSaveRequestModel.fromJson(Map<String,dynamic> json) => _$TripSaveRequestModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripSaveRequestModelToJson(this);
}
