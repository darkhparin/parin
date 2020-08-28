import 'package:json_annotation/json_annotation.dart';
import "consilidatedEwayBillModel.dart";
part 'consolidatedEwayBillRequestModel.g.dart';

@JsonSerializable()
class ConsolidatedEwayBillRequestModel {
    ConsolidatedEwayBillRequestModel();

    num tripId;
    num tripRouteId;
    num sequenceNo;
    String branchCode;
    String tripName;
    num userId;
    String vehicleNo;
    String place_of_consignor;
    String state_of_consignor;
    String transporter_document_number;
    String transporter_document_date;
    List<ConsilidatedEwayBillModel> ewayBills;
    
    factory ConsolidatedEwayBillRequestModel.fromJson(Map<String,dynamic> json) => _$ConsolidatedEwayBillRequestModelFromJson(json);
    Map<String, dynamic> toJson() => _$ConsolidatedEwayBillRequestModelToJson(this);
}
