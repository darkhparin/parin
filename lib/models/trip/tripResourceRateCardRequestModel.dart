import 'package:json_annotation/json_annotation.dart';

part 'tripResourceRateCardRequestModel.g.dart';

@JsonSerializable()
class TripResourceRateCardRequestModel {
    TripResourceRateCardRequestModel();

    num fromBranchId;
    num toBranchId;
    num resourceTypeId;
    num resourceId;
    num serviceId;
    num vehicleId;
    String brokerRateTypeName;
    
    factory TripResourceRateCardRequestModel.fromJson(Map<String,dynamic> json) => _$TripResourceRateCardRequestModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripResourceRateCardRequestModelToJson(this);
}
