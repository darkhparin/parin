import 'package:json_annotation/json_annotation.dart';
import "tripResourceRateCardModel.dart";
part 'tripDriverRateCardModel.g.dart';

@JsonSerializable()
class TripDriverRateCardModel {
  TripDriverRateCardModel();

  num driverRateCard_Id;
  TripResourceRateCardModel rateCard;
  String fromDate;
  String toDate;
  num fuelSurcharge;
  num basicDieselRate;
  num surchargeRatio;
  num ceilingLimit;
  bool isCeiling;
  bool validated;
  String validatedOn;
  String validatedBy;

  factory TripDriverRateCardModel.fromJson(Map<String, dynamic> json) =>
      _$TripDriverRateCardModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripDriverRateCardModelToJson(this);
}
