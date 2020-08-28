import 'package:json_annotation/json_annotation.dart';

part 'Apiresponce.g.dart';

@JsonSerializable()
class Apiresponce {
    Apiresponce();

    bool error;
    String message;
    
    factory Apiresponce.fromJson(Map<String,dynamic> json) => _$ApiresponceFromJson(json);
    Map<String, dynamic> toJson() => _$ApiresponceToJson(this);
}
