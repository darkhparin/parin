import 'package:json_annotation/json_annotation.dart';
import "tripVehicleAutoFillModel.dart";
part 'tripVehicleAutoFillListModel.g.dart';

@JsonSerializable()
class TripVehicleAutoFillListModel {
  TripVehicleAutoFillListModel();

  List<TripVehicleAutoFillModel> vehicles;

  factory TripVehicleAutoFillListModel.fromJson(List json) =>
      _$TripVehicleAutoFillListModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripVehicleAutoFillListModelToJson(this);
}
