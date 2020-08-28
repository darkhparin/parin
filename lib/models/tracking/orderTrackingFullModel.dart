import 'package:json_annotation/json_annotation.dart';
import "orderTrackingFullModeltsd.dart";
import "orderTrackingFullModelod.dart";
import "orderTrackingFullModelpd.dart";
part 'orderTrackingFullModel.g.dart';

@JsonSerializable()
class OrderTrackingFullModel {
    OrderTrackingFullModel();

    String code;
    bool isOrder;
    String consignor;
    String consignee;
    String mode;
    String paymentMode;
    num qty;
    num weight;
    num totalFreight;
    String expDeliveryDate;
    String bookingRemarks;
    String deliveryRemarks;
    String bookingDate;
    String bookingStation;
    String deliveryStation;
    String dwbStatus;
    String deliveryDate;
    List<OrderTrackingFullModeltsd> transhipmentDetails;
    List<OrderTrackingFullModelod> orderDocuments;
    List<OrderTrackingFullModelod> orderPODDocuments;
    OrderTrackingFullModelpd packetDetails;
    String invoiceCode;
    String invoiceDate;
    String invoiceStatus;
    String receiptNo;
    String sender;
    String recipient;
    String packetDate;
    String fromBranchPacket;
    String toBranchPacket;
    String packetStatus;
    String acknowledgeDate;
    String packetDocuments;
    
    factory OrderTrackingFullModel.fromJson(Map<String,dynamic> json) => _$OrderTrackingFullModelFromJson(json);
    Map<String, dynamic> toJson() => _$OrderTrackingFullModelToJson(this);
}
