import 'package:json_annotation/json_annotation.dart';

part 'opdacharges.g.dart';

@JsonSerializable()
class Opdacharges {
    Opdacharges();

    num chargeId;
    num cardId;
    num fromDistance;
    num toDistance;
    num minWeight;
    num maxWeight;
    num charge;
    
    factory Opdacharges.fromJson(Map<String,dynamic> json) => _$OpdachargesFromJson(json);
    Map<String, dynamic> toJson() => _$OpdachargesToJson(this);
}
