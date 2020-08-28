import 'package:json_annotation/json_annotation.dart';

part 'tripVehicleDriverModel.g.dart';

@JsonSerializable()
class TripVehicleDriverModel {
    TripVehicleDriverModel();

    num id;
    String name;
    String phone_M;
    String phone_M2;
    String licenseNr;
    String licenseExpireOn;
    String lincesePlace;
    String licenseIssuedOn;
    bool isDeleted;
    bool isOwned;
    bool isActive;
    
    factory TripVehicleDriverModel.fromJson(Map<String,dynamic> json) => _$TripVehicleDriverModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripVehicleDriverModelToJson(this);
}
