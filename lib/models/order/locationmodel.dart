import 'package:json_annotation/json_annotation.dart';

part 'locationmodel.g.dart';

@JsonSerializable()
class Locationmodel {
    Locationmodel();

    num id;
    String address;
    String street;
    String postalCode;
    num state_Id;
    num city_Id;
    num cityArea_Id;
    
    factory Locationmodel.fromJson(Map<String,dynamic> json) => _$LocationmodelFromJson(json);
    Map<String, dynamic> toJson() => _$LocationmodelToJson(this);
}
