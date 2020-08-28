import 'package:json_annotation/json_annotation.dart';

part 'pincodeshort.g.dart';

@JsonSerializable()
class Pincodeshort {
    Pincodeshort();

    num pincode;
    String address;
    
    factory Pincodeshort.fromJson(Map<String,dynamic> json) => _$PincodeshortFromJson(json);
    Map<String, dynamic> toJson() => _$PincodeshortToJson(this);
}
