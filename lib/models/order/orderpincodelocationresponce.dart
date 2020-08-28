import 'package:json_annotation/json_annotation.dart';

part 'orderpincodelocationresponce.g.dart';

@JsonSerializable()
class Orderpincodelocationresponce {
    Orderpincodelocationresponce();

    num id;
    String address;
    String street;
    String postalCode;
    num state_Id;
    String state;
    num city_Id;
    String city;
    num cityArea_Id;
    String cityArea;
    
    factory Orderpincodelocationresponce.fromJson(Map<String,dynamic> json) => _$OrderpincodelocationresponceFromJson(json);
    Map<String, dynamic> toJson() => _$OrderpincodelocationresponceToJson(this);
}
