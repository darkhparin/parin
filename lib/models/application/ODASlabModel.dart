import 'package:json_annotation/json_annotation.dart';

part 'ODASlabModel.g.dart';

@JsonSerializable()
class ODASlabModel {
    ODASlabModel();

    num distnaceStartIndex;
    num distanceEndIndex;
    num weightStartIndex;
    num weightEndIndex;
    num charge;
    
    factory ODASlabModel.fromJson(Map<String,dynamic> json) => _$ODASlabModelFromJson(json);
    Map<String, dynamic> toJson() => _$ODASlabModelToJson(this);
}
