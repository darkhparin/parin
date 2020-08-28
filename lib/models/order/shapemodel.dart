import 'package:json_annotation/json_annotation.dart';

part 'shapemodel.g.dart';

@JsonSerializable()
class Shapemodel {
    Shapemodel();

    num id;
    String name;
    bool isActive;
    num seqOrder;
    
    factory Shapemodel.fromJson(Map<String,dynamic> json) => _$ShapemodelFromJson(json);
    Map<String, dynamic> toJson() => _$ShapemodelToJson(this);
}
