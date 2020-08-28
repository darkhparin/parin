import 'package:json_annotation/json_annotation.dart';

part 'tripTruckLoadModel.g.dart';

@JsonSerializable()
class TripTruckLoadModel {
    TripTruckLoadModel();

    num id;
    num loadType_Id;
    String loadType;
    num sequenceNr;
    String code;
    num fromBranch_Id;
    num toBranch_Id;
    String fromBranch;
    String toBranch;
    String bookingBranch;
    String deliveryBranch;
    num status_Id;
    String status;
    bool isDamaged;
    num damagedQty;
    num qty;
    String productType;
    String packageType;
    num weight;
    num tripRoute_Id;
    bool canUnplan;
    bool canReceive;
    num serviceTypeId;
    String serviceType;
    String vehicleNo;
    num vehicleId;
    String tripName;
    String unplanVisibility;
    String receiveVisibility;
    
    factory TripTruckLoadModel.fromJson(Map<String,dynamic> json) => _$TripTruckLoadModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripTruckLoadModelToJson(this);
}
