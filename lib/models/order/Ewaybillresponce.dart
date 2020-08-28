import 'package:cwl/models/application/index.dart';
import 'package:json_annotation/json_annotation.dart';
import "ewaybillcore.dart";
import "ewbParty.dart";
part 'Ewaybillresponce.g.dart';

@JsonSerializable()
class Ewaybillresponce {
  Ewaybillresponce();

  List<Ewaybillcore> allEwayBills;
  List<Ewaybillcore> otherEwayBills;
  num deliveryBranchId;
  String deliveryBranch;
  num deliveryPincode;
  bool isManualEwayBill;
  List<EwbParty> consignors;
  List<EwbParty> consignees;
  bool consignor_IsURP;
  bool consignee_IsURP;
  Docketnoresponce docketResponce;

  factory Ewaybillresponce.fromJson(Map<String, dynamic> json) =>
      _$EwaybillresponceFromJson(json);
  Map<String, dynamic> toJson() => _$EwaybillresponceToJson(this);
}
