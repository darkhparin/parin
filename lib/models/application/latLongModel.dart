import 'package:json_annotation/json_annotation.dart';

part 'latLongModel.g.dart';

@JsonSerializable()
class LatLongModel {
    LatLongModel();

    num latitude;
    num longitude;
    
    factory LatLongModel.fromJson(Map<String,dynamic> json) => _$LatLongModelFromJson(json);
    Map<String, dynamic> toJson() => _$LatLongModelToJson(this);
}
