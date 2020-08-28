import 'package:json_annotation/json_annotation.dart';

part 'Loginresponce.g.dart';

@JsonSerializable()
class Loginresponce {
    Loginresponce();

    String access_Token;
    String userName;
    String token_Type;
    num expires_in;
    
    factory Loginresponce.fromJson(Map<String,dynamic> json) => _$LoginresponceFromJson(json);
    Map<String, dynamic> toJson() => _$LoginresponceToJson(this);
}
