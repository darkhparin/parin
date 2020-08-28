import 'package:json_annotation/json_annotation.dart';

part 'commonmodel.g.dart';

@JsonSerializable()
class Commonmodel {
    Commonmodel();

    num id;
    String name;
    
    factory Commonmodel.fromJson(Map<String,dynamic> json) => _$CommonmodelFromJson(json);
    Map<String, dynamic> toJson() => _$CommonmodelToJson(this);
}
