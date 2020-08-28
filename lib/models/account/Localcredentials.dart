import 'package:json_annotation/json_annotation.dart';

part 'Localcredentials.g.dart';

@JsonSerializable()
class Localcredentials {
    Localcredentials();

    String username;
    String password;
    
    factory Localcredentials.fromJson(Map<String,dynamic> json) => _$LocalcredentialsFromJson(json);
    Map<String, dynamic> toJson() => _$LocalcredentialsToJson(this);
}
