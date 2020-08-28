import 'package:json_annotation/json_annotation.dart';

part 'tripServiceTypeModel.g.dart';

@JsonSerializable()
class TripServiceTypeModel {
    TripServiceTypeModel();

    num serviceTypeId;
    String serviceType;
    
    factory TripServiceTypeModel.fromJson(Map<String,dynamic> json) => _$TripServiceTypeModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripServiceTypeModelToJson(this);
}
