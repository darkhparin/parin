import 'package:json_annotation/json_annotation.dart';

part 'tripTruckLoadDetailsModel.g.dart';

@JsonSerializable()
class TripTruckLoadDetailsModel {
    TripTruckLoadDetailsModel();

    num loadTypeId;
    String loadType;
    String code;
    num id;
    String bookingDate;
    String bookingBranch;
    String deliveryBranch;
    String sourceBranch;
    num toID;
    String destinationBranch;
    String status;
    String packageType;
    String productType;
    num weight;
    num qty;
    String serviceName;
    num serviceId;
    bool isTranship;
    String remark;
    bool isAck;
    
    factory TripTruckLoadDetailsModel.fromJson(Map<String,dynamic> json) => _$TripTruckLoadDetailsModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripTruckLoadDetailsModelToJson(this);
}
