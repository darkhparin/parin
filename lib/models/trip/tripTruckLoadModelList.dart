import 'package:json_annotation/json_annotation.dart';
import "tripTruckLoadModel.dart";
part 'tripTruckLoadModelList.g.dart';

@JsonSerializable()
class TripTruckLoadModelList {
  TripTruckLoadModelList();

  List<TripTruckLoadModel> truckloads;

  factory TripTruckLoadModelList.fromJson(List json) =>
      _$TripTruckLoadModelListFromJson(json);
  Map<String, dynamic> toJson() => _$TripTruckLoadModelListToJson(this);
}
