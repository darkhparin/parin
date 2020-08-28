import 'package:json_annotation/json_annotation.dart';

part 'UpdateTripLocaion_request_model.g.dart';

@JsonSerializable()
class UpdateTripLocaion_request_model {
    UpdateTripLocaion_request_model();

    num tripId;
    num latitude;
    num longitude;
    
    factory UpdateTripLocaion_request_model.fromJson(Map<String,dynamic> json) => _$UpdateTripLocaion_request_modelFromJson(json);
    Map<String, dynamic> toJson() => _$UpdateTripLocaion_request_modelToJson(this);
}
