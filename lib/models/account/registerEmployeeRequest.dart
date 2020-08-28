import 'package:json_annotation/json_annotation.dart';

part 'registerEmployeeRequest.g.dart';

@JsonSerializable()
class RegisterEmployeeRequest {
    RegisterEmployeeRequest();

    String userName;
    String password;
    String mobileNo;
    String email;
    String deviceId;
    num deviceTypeId;
    
    factory RegisterEmployeeRequest.fromJson(Map<String,dynamic> json) => _$RegisterEmployeeRequestFromJson(json);
    Map<String, dynamic> toJson() => _$RegisterEmployeeRequestToJson(this);
}
