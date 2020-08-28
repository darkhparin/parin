import 'package:json_annotation/json_annotation.dart';
import 'package:cwl/models/application/ODASlabModel.dart';
part 'PartyServicibilityResponce.g.dart';

@JsonSerializable()
class PartyServicibilityResponce {
  PartyServicibilityResponce();

  String pincode;
  bool isServicible;
  String branch;
  num distance;
  bool isoda;
  List<ODASlabModel> odaSlab;

  factory PartyServicibilityResponce.fromJson(Map<String, dynamic> json) =>
      _$PartyServicibilityResponceFromJson(json);
  Map<String, dynamic> toJson() => _$PartyServicibilityResponceToJson(this);
}
