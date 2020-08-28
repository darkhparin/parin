import 'package:json_annotation/json_annotation.dart';

part 'tripVehicleAutoFillModel.g.dart';

@JsonSerializable()
class TripVehicleAutoFillModel {
    TripVehicleAutoFillModel();

    num vehicle_Id;
    String vehicle_Number;
    bool isSelectable;
    String tripNo;
    String vehicleType;
    
    factory TripVehicleAutoFillModel.fromJson(Map<String,dynamic> json) => _$TripVehicleAutoFillModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripVehicleAutoFillModelToJson(this);
}
