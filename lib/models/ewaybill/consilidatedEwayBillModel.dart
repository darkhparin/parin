import 'package:json_annotation/json_annotation.dart';

part 'consilidatedEwayBillModel.g.dart';

@JsonSerializable()
class ConsilidatedEwayBillModel {
    ConsilidatedEwayBillModel();

    String docketNo;
    num ewayBillNo;
    String ewayBillDate;
    String ewayBillValidUpto;
    String from;
    String to;
    String consignee;
    String invoiceNo;
    num totalInvoiceValue;
    String ewayBillStatus;
    
    factory ConsilidatedEwayBillModel.fromJson(Map<String,dynamic> json) => _$ConsilidatedEwayBillModelFromJson(json);
    Map<String, dynamic> toJson() => _$ConsilidatedEwayBillModelToJson(this);
}
