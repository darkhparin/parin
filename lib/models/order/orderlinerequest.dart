import 'package:json_annotation/json_annotation.dart';

part 'orderlinerequest.g.dart';

@JsonSerializable()
class Orderlinerequest {
    Orderlinerequest();

    num serviceTypeId;
    num productTypeId;
    num packageTypeId;
    num shapeId;
    num volumeFector;
    num rate;
    num qty;
    num actualweight;
    num oLength;
    num oWidth;
    num oHeight;
    num dimentionMode;
    String privateMark;
    
    factory Orderlinerequest.fromJson(Map<String,dynamic> json) => _$OrderlinerequestFromJson(json);
    Map<String, dynamic> toJson() => _$OrderlinerequestToJson(this);
}
