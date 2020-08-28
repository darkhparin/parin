import 'package:json_annotation/json_annotation.dart';
import "tripRouteModel.dart";
part 'tripRouteModelList.g.dart';

@JsonSerializable()
class TripRouteModelList {
  TripRouteModelList();

  List<TripRouteModel> triproutes;

  factory TripRouteModelList.fromJson(List json) =>
      _$TripRouteModelListFromJson(json);
  Map<String, dynamic> toJson() => _$TripRouteModelListToJson(this);
}
