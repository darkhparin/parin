import 'package:json_annotation/json_annotation.dart';
import "package:cwl/models/application/commonmodel.dart";
part 'Docketnoresponce.g.dart';

@JsonSerializable()
class Docketnoresponce {
  Docketnoresponce();

  String docketNo;
  num currentFuelRate;
  bool isBookingBranchServiceable;
  bool isBookingBranchHasBookingRight;
  num bookingBranchId;
  String bookingBranch;
  num companyId;
  num bookingPincode;
  Commonmodel vendor;
  List<Commonmodel> vendorList;

  factory Docketnoresponce.fromJson(Map<String, dynamic> json) =>
      _$DocketnoresponceFromJson(json);
  Map<String, dynamic> toJson() => _$DocketnoresponceToJson(this);
}
