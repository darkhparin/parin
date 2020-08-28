import 'package:json_annotation/json_annotation.dart';

part 'tripResourceRateCardChargesModel.g.dart';

@JsonSerializable()
class TripResourceRateCardChargesModel {
    TripResourceRateCardChargesModel();

    num rateCharges_Id;
    num rate;
    String from_Branch;
    String to_Branch;
    num fromBranch_Id;
    num toBranch_Id;
    num divisionRatio;
    num duration;
    num minRate;
    num maxRate;
    bool isDeleted;
    
    factory TripResourceRateCardChargesModel.fromJson(Map<String,dynamic> json) => _$TripResourceRateCardChargesModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripResourceRateCardChargesModelToJson(this);
}
