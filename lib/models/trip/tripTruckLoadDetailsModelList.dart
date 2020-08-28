import 'package:json_annotation/json_annotation.dart';
import "tripTruckLoadDetailsModel.dart";
part 'tripTruckLoadDetailsModelList.g.dart';

@JsonSerializable()
class TripTruckLoadDetailsModelList {
  TripTruckLoadDetailsModelList();

  List<TripTruckLoadDetailsModel> truckloaddetails;

  factory TripTruckLoadDetailsModelList.fromJson(List json) =>
      _$TripTruckLoadDetailsModelListFromJson(json);
  Map<String, dynamic> toJson() => _$TripTruckLoadDetailsModelListToJson(this);
}
