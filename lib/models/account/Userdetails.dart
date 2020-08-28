import 'package:json_annotation/json_annotation.dart';

part 'Userdetails.g.dart';

@JsonSerializable()
class Userdetails {
    Userdetails();

    num userId;
    String deviceId;
    num deviceTypeId;
    String name;
    String firstName;
    String lastName;
    String userType;
    num userTypeId;
    num employeeId;
    
    factory Userdetails.fromJson(Map<String,dynamic> json) => _$UserdetailsFromJson(json);
    Map<String, dynamic> toJson() => _$UserdetailsToJson(this);
}
