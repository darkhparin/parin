import 'package:json_annotation/json_annotation.dart';
import "ratecardcharges.dart";
import "ewaybillcore.dart";
import "ratecalculationresponce.dart";
import "locationmodel.dart";
import "orderlineresponce.dart";
part 'ordersaverequest.g.dart';

@JsonSerializable()
class Ordersaverequest {
  Ordersaverequest();

  num userId;
  num deviceTypeId;
  String docketNo;
  num bookingBranchId;
  num deliveryBranchId;
  num consignorId;
  num consigneeId;
  num liablePartyId;
  String bookingDate;
  String bookingTime;
  Ratecardcharges rateCardCharges;
  num paymentModeId;
  num serviceTypeId;
  num transportAsId;
  String docketRemark;
  List<Ewaybillcore> ewayBills;
  num vendorId;
  Ratecalculationresponce orderCharges;
  num partyRateCardId;
  num rateCardId;
  bool hasCOD;
  bool hasDACC;
  num newRate;
  num collectionTypeId;
  bool verifyAtSave;
  Locationmodel pickUpLoaction;
  Locationmodel deliveryLocation;
  List<Orderlineresponce> orderLines;
  bool isAccountCopyVerified;
  String accountCopyFilePath;
  num accountCopyVerifiedBy;

  factory Ordersaverequest.fromJson(Map<String, dynamic> json) =>
      _$OrdersaverequestFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersaverequestToJson(this);
}
