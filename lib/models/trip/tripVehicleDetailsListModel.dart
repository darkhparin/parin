import 'package:json_annotation/json_annotation.dart';
import "tripVehicleDetailsModel.dart";
part 'tripVehicleDetailsListModel.g.dart';

@JsonSerializable()
class TripVehicleDetailsListModel {
  TripVehicleDetailsListModel();

  List<TripVehicleDetailsModel> vehicledetails;

  factory TripVehicleDetailsListModel.fromJson(List json) =>
      _$TripVehicleDetailsListModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripVehicleDetailsListModelToJson(this);
}
