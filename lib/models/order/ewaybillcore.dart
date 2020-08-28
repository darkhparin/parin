import 'package:json_annotation/json_annotation.dart';

part 'ewaybillcore.g.dart';

@JsonSerializable()
class Ewaybillcore {
    Ewaybillcore();

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
    
    factory Ewaybillcore.fromJson(Map<String,dynamic> json) => _$EwaybillcoreFromJson(json);
    Map<String, dynamic> toJson() => _$EwaybillcoreToJson(this);
}
