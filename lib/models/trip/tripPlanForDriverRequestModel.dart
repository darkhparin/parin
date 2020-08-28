import 'package:json_annotation/json_annotation.dart';

part 'tripPlanForDriverRequestModel.g.dart';

@JsonSerializable()
class TripPlanForDriverRequestModel {
    TripPlanForDriverRequestModel();

    num tripRouteId;
    num loadId;
    num loadTypeId;
    
    factory TripPlanForDriverRequestModel.fromJson(Map<String,dynamic> json) => _$TripPlanForDriverRequestModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripPlanForDriverRequestModelToJson(this);
}
