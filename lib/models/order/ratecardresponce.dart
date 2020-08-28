import 'package:json_annotation/json_annotation.dart';

part 'ratecardresponce.g.dart';

@JsonSerializable()
class Ratecardresponce {
    Ratecardresponce();

    num partyRateCardTypeId;
    num partyRateCardId;
    num rateCardId;
    String rateCardName;
    String rateCardType;
    String defaultStatus;
    String defaultStatusColor;
    bool isDefault;
    String activeStatus;
    String activeStatusColor;
    String validStatus;
    String validStatusColor;
    num docket;
    num fod;
    num cod;
    num fov;
    num pod;
    num dacc;
    num minAirCharge;
    num minSurfaceCharge;
    num minRailCharge;
    num fuelSurcharge;
    num codPercentage;
    num daccPercentage;
    num volumeFactor;
    num baseFuelRate;
    num surchargeRatio;
    num ceillinglimit;
    num railFuelSurcharge;
    num airFuelSurcharge;
    num demurrageHours;
    num demurrageRate;
    bool isRateCardCharesAvilable;
    String fromBranch;
    String toBranch;
    num opaDistance;
    num odaDistance;
    num opaCard_Id;
    num odaCard_Id;
    bool isSurfaceWeightPerDocket;
    bool isAirWeightPerDocket;
    bool isRailWeightPerDocket;
    bool isSelectable;
    num miscCharge;
    num loadingCharges;
    num unLoadingcharges;
    String validTill;
    
    factory Ratecardresponce.fromJson(Map<String,dynamic> json) => _$RatecardresponceFromJson(json);
    Map<String, dynamic> toJson() => _$RatecardresponceToJson(this);
}
