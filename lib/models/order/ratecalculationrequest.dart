import 'package:json_annotation/json_annotation.dart';

part 'ratecalculationrequest.g.dart';

@JsonSerializable()
class Ratecalculationrequest {
  Ratecalculationrequest();

  num company_Margin;
  num company_FinalRate;
  String docketNo;
  num bookingBranchId;
  num deliveryBranchId;
  num oPADistance;
  num oDADistance;
  num actualWeight;
  num chargedWeight;
  num qty;
  num serviceTypeId;
  num paymentModeId;
  num payeeId;
  num partyRateCardId;
  num transportAsId;
  num fuelSurchargePercent;
  num fovPercent;
  num consignorId;
  num consigneeId;
  num totalInvoiceValue;
  bool isCOD;
  bool isDACC;
  num codValue;
  num pickupTypeId;
  num deliveryTypeId;
  num consignorPincode;
  num consigneePincode;
  num miscCharge;
  num loadingCharge;
  num unloadingCharge;
  num ftlRateCardChargesId;

  factory Ratecalculationrequest.fromJson(Map<String, dynamic> json) =>
      _$RatecalculationrequestFromJson(json);
  Map<String, dynamic> toJson() => _$RatecalculationrequestToJson(this);
}
