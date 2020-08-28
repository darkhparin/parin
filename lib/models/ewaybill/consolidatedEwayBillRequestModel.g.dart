// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consolidatedEwayBillRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsolidatedEwayBillRequestModel _$ConsolidatedEwayBillRequestModelFromJson(
    Map<String, dynamic> json) {
  return ConsolidatedEwayBillRequestModel()
    ..tripId = json['tripId'] as num
    ..tripRouteId = json['tripRouteId'] as num
    ..sequenceNo = json['sequenceNo'] as num
    ..branchCode = json['branchCode'] as String
    ..tripName = json['tripName'] as String
    ..userId = json['userId'] as num
    ..vehicleNo = json['vehicleNo'] as String
    ..place_of_consignor = json['place_of_consignor'] as String
    ..state_of_consignor = json['state_of_consignor'] as String
    ..transporter_document_number =
        json['transporter_document_number'] as String
    ..transporter_document_date = json['transporter_document_date'] as String
    ..ewayBills = (json['ewayBills'] as List)
        ?.map((e) => e == null
            ? null
            : ConsilidatedEwayBillModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ConsolidatedEwayBillRequestModelToJson(
        ConsolidatedEwayBillRequestModel instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'tripRouteId': instance.tripRouteId,
      'sequenceNo': instance.sequenceNo,
      'branchCode': instance.branchCode,
      'tripName': instance.tripName,
      'userId': instance.userId,
      'vehicleNo': instance.vehicleNo,
      'place_of_consignor': instance.place_of_consignor,
      'state_of_consignor': instance.state_of_consignor,
      'transporter_document_number': instance.transporter_document_number,
      'transporter_document_date': instance.transporter_document_date,
      'ewayBills': instance.ewayBills
    };
