import 'package:json_annotation/json_annotation.dart';
import "ewbParty.dart";
part 'ewbPartyList.g.dart';

@JsonSerializable()
class EwbPartyList {
  EwbPartyList();

  List<EwbParty> parties;

  factory EwbPartyList.fromJson(List json) => _$EwbPartyListFromJson(json);
  Map<String, dynamic> toJson() => _$EwbPartyListToJson(this);
}
