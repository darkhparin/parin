import 'package:json_annotation/json_annotation.dart';

part 'Loginrequest.g.dart';

@JsonSerializable()
class Loginrequest {
    Loginrequest();

    String userName;
    String password;
    num deviceType;
    List deviceIds;
    
    factory Loginrequest.fromJson(Map<String,dynamic> json) => _$LoginrequestFromJson(json);
    Map<String, dynamic> toJson() => _$LoginrequestToJson(this);
}
