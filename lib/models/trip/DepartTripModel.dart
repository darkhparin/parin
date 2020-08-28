import 'package:json_annotation/json_annotation.dart';

part 'DepartTripModel.g.dart';

@JsonSerializable()
class DepartTripModel {
    DepartTripModel();

    num tripId;
    String sealNo;
    num reading;
    
    factory DepartTripModel.fromJson(Map<String,dynamic> json) => _$DepartTripModelFromJson(json);
    Map<String, dynamic> toJson() => _$DepartTripModelToJson(this);
}
