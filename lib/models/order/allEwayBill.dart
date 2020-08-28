import 'package:json_annotation/json_annotation.dart';

part 'allEwayBill.g.dart';

@JsonSerializable()
class AllEwayBill {
    AllEwayBill();

    num ewayBillId;
    num ewayBillNo;
    String ewayBillDate;
    String ewayBillValidTill;
    String consignorGSTIN;
    num consignorPincode;
    String consignor;
    String consigneeGSTIN;
    num consigneePincode;
    String consignee;
    num total_invoice_value;
    String document_number;
    bool hasErrors;
    List errors;
    
    factory AllEwayBill.fromJson(Map<String,dynamic> json) => _$AllEwayBillFromJson(json);
    Map<String, dynamic> toJson() => _$AllEwayBillToJson(this);
}
