import 'package:json_annotation/json_annotation.dart';

part 'tripBrockerRateTypeModel.g.dart';

@JsonSerializable()
class TripBrockerRateTypeModel {
    TripBrockerRateTypeModel();

    num rateTypeId;
    String rateType;
    
    factory TripBrockerRateTypeModel.fromJson(Map<String,dynamic> json) => _$TripBrockerRateTypeModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripBrockerRateTypeModelToJson(this);
}
