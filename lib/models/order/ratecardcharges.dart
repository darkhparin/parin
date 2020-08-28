import 'package:json_annotation/json_annotation.dart';

part 'ratecardcharges.g.dart';

@JsonSerializable()
class Ratecardcharges {
    Ratecardcharges();

    num rateCardChargesId;
    num rateCardId;
    String type;
    num typeId;
    num rate;
    num fromUnit;
    num toUnit;
    String vehicleType;
    num vehicleTypeId;
    String vehicleTypeVisibility;
    num transitDays;
    num fromBranch_Id;
    num toBranch_Id;
    String fromBranch;
    String toBranch;
    num defaultRateChargesId;
    
    factory Ratecardcharges.fromJson(Map<String,dynamic> json) => _$RatecardchargesFromJson(json);
    Map<String, dynamic> toJson() => _$RatecardchargesToJson(this);
}
