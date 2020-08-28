import 'package:json_annotation/json_annotation.dart';

part 'updatedeviceIdrequest.g.dart';

@JsonSerializable()
class UpdatedeviceIdrequest {
    UpdatedeviceIdrequest();

    num userId;
    String deviceId;
    num deviceTypeId;
    num otp;
    
    factory UpdatedeviceIdrequest.fromJson(Map<String,dynamic> json) => _$UpdatedeviceIdrequestFromJson(json);
    Map<String, dynamic> toJson() => _$UpdatedeviceIdrequestToJson(this);
}
