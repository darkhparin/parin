// To parse this JSON data, do
//
//     final orderTrackingFullModel1 = orderTrackingFullModel1FromJson(jsonString);

import 'dart:convert';

OrderTrackingFullModel1 orderTrackingFullModel1FromJson(String str) =>
    OrderTrackingFullModel1.fromJson(json.decode(str));

String orderTrackingFullModel1ToJson(OrderTrackingFullModel1 data) =>
    json.encode(data.toJson());

class OrderTrackingFullModel1 {
  OrderTrackingFullModel1({
    this.code,
    this.isOrder,
    this.consignor,
    this.consignee,
    this.mode,
    this.paymentMode,
    this.qty,
    this.weight,
    this.totalFreight,
    this.expDeliveryDate,
    this.bookingRemarks,
    this.deliveryRemarks,
    this.bookingDate,
    this.bookingStation,
    this.deliveryStation,
    this.dwbStatus,
    this.deliveryDate,
    this.transhipmentDetails,
    this.orderDocuments,
    this.orderPodDocuments,
    this.packetDetails,
    this.invoiceCode,
    this.invoiceDate,
    this.invoiceStatus,
    this.receiptNo,
    this.sender,
    this.recipient,
    this.packetDate,
    this.fromBranchPacket,
    this.toBranchPacket,
    this.packetStatus,
    this.acknowledgeDate,
    this.packetDocuments,
  });

  String code;
  bool isOrder;
  String consignor;
  String consignee;
  String mode;
  String paymentMode;
  int qty;
  int weight;
  int totalFreight;
  DateTime expDeliveryDate;
  String bookingRemarks;
  String deliveryRemarks;
  DateTime bookingDate;
  String bookingStation;
  String deliveryStation;
  String dwbStatus;
  DateTime deliveryDate;
  List<TranshipmentDetail> transhipmentDetails;
  List<Document> orderDocuments;
  List<Document> orderPodDocuments;
  PacketDetails packetDetails;
  String invoiceCode;
  DateTime invoiceDate;
  String invoiceStatus;
  String receiptNo;
  String sender;
  String recipient;
  DateTime packetDate;
  String fromBranchPacket;
  String toBranchPacket;
  String packetStatus;
  DateTime acknowledgeDate;
  List<Document> packetDocuments;

  factory OrderTrackingFullModel1.fromJson(Map<String, dynamic> json) =>
      OrderTrackingFullModel1(
        code: json["code"],
        isOrder: json["isOrder"],
        consignor: json["consignor"],
        consignee: json["consignee"],
        mode: json["mode"],
        paymentMode: json["paymentMode"],
        qty: json["qty"],
        weight: json["weight"],
        totalFreight: json["totalFreight"],
        expDeliveryDate: DateTime.parse(json["expDeliveryDate"]),
        bookingRemarks: json["bookingRemarks"],
        deliveryRemarks: json["deliveryRemarks"],
        bookingDate: DateTime.parse(json["bookingDate"]),
        bookingStation: json["bookingStation"],
        deliveryStation: json["deliveryStation"],
        dwbStatus: json["dwbStatus"],
        deliveryDate: DateTime.parse(json["deliveryDate"]),
        transhipmentDetails: List<TranshipmentDetail>.from(
            json["transhipmentDetails"]
                .map((x) => TranshipmentDetail.fromJson(x))),
        orderDocuments: List<Document>.from(
            json["orderDocuments"].map((x) => Document.fromJson(x))),
        orderPodDocuments: List<Document>.from(
            json["orderPODDocuments"].map((x) => Document.fromJson(x))),
        packetDetails: PacketDetails.fromJson(json["packetDetails"]),
        invoiceCode: json["invoiceCode"],
        invoiceDate: DateTime.parse(json["invoiceDate"]),
        invoiceStatus: json["invoiceStatus"],
        receiptNo: json["receiptNo"],
        sender: json["sender"],
        recipient: json["recipient"],
        packetDate: DateTime.parse(json["packetDate"]),
        fromBranchPacket: json["fromBranchPacket"],
        toBranchPacket: json["toBranchPacket"],
        packetStatus: json["packetStatus"],
        acknowledgeDate: DateTime.parse(json["acknowledgeDate"]),
        packetDocuments: List<Document>.from(
            json["packetDocuments"].map((x) => Document.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "isOrder": isOrder,
        "consignor": consignor,
        "consignee": consignee,
        "mode": mode,
        "paymentMode": paymentMode,
        "qty": qty,
        "weight": weight,
        "totalFreight": totalFreight,
        "expDeliveryDate": expDeliveryDate.toIso8601String(),
        "bookingRemarks": bookingRemarks,
        "deliveryRemarks": deliveryRemarks,
        "bookingDate": bookingDate.toIso8601String(),
        "bookingStation": bookingStation,
        "deliveryStation": deliveryStation,
        "dwbStatus": dwbStatus,
        "deliveryDate": deliveryDate.toIso8601String(),
        "transhipmentDetails":
            List<dynamic>.from(transhipmentDetails.map((x) => x.toJson())),
        "orderDocuments":
            List<dynamic>.from(orderDocuments.map((x) => x.toJson())),
        "orderPODDocuments":
            List<dynamic>.from(orderPodDocuments.map((x) => x.toJson())),
        "packetDetails": packetDetails.toJson(),
        "invoiceCode": invoiceCode,
        "invoiceDate": invoiceDate.toIso8601String(),
        "invoiceStatus": invoiceStatus,
        "receiptNo": receiptNo,
        "sender": sender,
        "recipient": recipient,
        "packetDate": packetDate.toIso8601String(),
        "fromBranchPacket": fromBranchPacket,
        "toBranchPacket": toBranchPacket,
        "packetStatus": packetStatus,
        "acknowledgeDate": acknowledgeDate.toIso8601String(),
        "packetDocuments":
            List<dynamic>.from(packetDocuments.map((x) => x.toJson())),
      };
}

class Document {
  Document({
    this.documentName,
    this.fileName,
    this.fileDate,
    this.documentId,
  });

  String documentName;
  String fileName;
  DateTime fileDate;
  int documentId;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        documentName: json["documentName"],
        fileName: json["fileName"],
        fileDate: DateTime.parse(json["fileDate"]),
        documentId: json["documentId"],
      );

  Map<String, dynamic> toJson() => {
        "documentName": documentName,
        "fileName": fileName,
        "fileDate": fileDate.toIso8601String(),
        "documentId": documentId,
      };
}

class PacketDetails {
  PacketDetails({
    this.packetNo,
    this.packetDate,
    this.packetStatus,
    this.packetAckDate,
    this.podPacketNo,
    this.podPacketDate,
    this.podPacketStatus,
    this.podPacketAckDate,
    this.codPacketNo,
    this.codPacketDate,
    this.codPacketStatus,
    this.codPacketAckDate,
  });

  String packetNo;
  DateTime packetDate;
  String packetStatus;
  DateTime packetAckDate;
  String podPacketNo;
  DateTime podPacketDate;
  String podPacketStatus;
  DateTime podPacketAckDate;
  String codPacketNo;
  DateTime codPacketDate;
  String codPacketStatus;
  DateTime codPacketAckDate;

  factory PacketDetails.fromJson(Map<String, dynamic> json) => PacketDetails(
        packetNo: json["packetNo"],
        packetDate: DateTime.parse(json["packetDate"]),
        packetStatus: json["packetStatus"],
        packetAckDate: DateTime.parse(json["packetAckDate"]),
        podPacketNo: json["podPacketNo"],
        podPacketDate: DateTime.parse(json["podPacketDate"]),
        podPacketStatus: json["podPacketStatus"],
        podPacketAckDate: DateTime.parse(json["podPacketAckDate"]),
        codPacketNo: json["codPacketNo"],
        codPacketDate: DateTime.parse(json["codPacketDate"]),
        codPacketStatus: json["codPacketStatus"],
        codPacketAckDate: DateTime.parse(json["codPacketAckDate"]),
      );

  Map<String, dynamic> toJson() => {
        "packetNo": packetNo,
        "packetDate": packetDate.toIso8601String(),
        "packetStatus": packetStatus,
        "packetAckDate": packetAckDate.toIso8601String(),
        "podPacketNo": podPacketNo,
        "podPacketDate": podPacketDate.toIso8601String(),
        "podPacketStatus": podPacketStatus,
        "podPacketAckDate": podPacketAckDate.toIso8601String(),
        "codPacketNo": codPacketNo,
        "codPacketDate": codPacketDate.toIso8601String(),
        "codPacketStatus": codPacketStatus,
        "codPacketAckDate": codPacketAckDate.toIso8601String(),
      };
}

class TranshipmentDetail {
  TranshipmentDetail({
    this.sequenceNr,
    this.fromStation,
    this.toStation,
    this.dispatchDate,
    this.arrivalDate,
    this.qty,
    this.weight,
    this.trip,
    this.vehicle,
    this.onHoldHours,
  });

  int sequenceNr;
  String fromStation;
  String toStation;
  DateTime dispatchDate;
  DateTime arrivalDate;
  int qty;
  int weight;
  String trip;
  String vehicle;
  int onHoldHours;

  factory TranshipmentDetail.fromJson(Map<String, dynamic> json) =>
      TranshipmentDetail(
        sequenceNr: json["sequenceNr"],
        fromStation: json["fromStation"],
        toStation: json["toStation"],
        dispatchDate: DateTime.parse(json["dispatchDate"]),
        arrivalDate: DateTime.parse(json["arrivalDate"]),
        qty: json["qty"],
        weight: json["weight"],
        trip: json["trip"],
        vehicle: json["vehicle"],
        onHoldHours: json["onHoldHours"],
      );

  Map<String, dynamic> toJson() => {
        "sequenceNr": sequenceNr,
        "fromStation": fromStation,
        "toStation": toStation,
        "dispatchDate": dispatchDate.toIso8601String(),
        "arrivalDate": arrivalDate.toIso8601String(),
        "qty": qty,
        "weight": weight,
        "trip": trip,
        "vehicle": vehicle,
        "onHoldHours": onHoldHours,
      };
}
