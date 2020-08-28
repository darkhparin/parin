import 'package:json_annotation/json_annotation.dart';
import "tripDriverRateCardModel.dart";
part 'tripDriverRateCardListModel.g.dart';

@JsonSerializable()
class TripDriverRateCardListModel {
  TripDriverRateCardListModel();

  List<TripDriverRateCardModel> driverratecards;

  factory TripDriverRateCardListModel.fromJson(List json) =>
      _$TripDriverRateCardListModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripDriverRateCardListModelToJson(this);
}
