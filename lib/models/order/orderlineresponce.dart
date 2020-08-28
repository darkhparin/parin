import 'package:json_annotation/json_annotation.dart';

part 'orderlineresponce.g.dart';

@JsonSerializable()
class Orderlineresponce {
    Orderlineresponce();

    num id;
    num length;
    num width;
    num height;
    String description;
    num qty;
    num actualWeight;
    num chargedWeight;
    num rate;
    bool isDeleted;
    num volumeFactor;
    num dimentionMode;
    num finalCharge;
    bool isVolumeBased;
    num order_Id;
    num productType_Id;
    num packageType_Id;
    String privateMark;
    num shapeId;
    num volumaticWeight;
    
    factory Orderlineresponce.fromJson(Map<String,dynamic> json) => _$OrderlineresponceFromJson(json);
    Map<String, dynamic> toJson() => _$OrderlineresponceToJson(this);
}
