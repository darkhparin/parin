// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratecalculationrequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratecalculationrequest _$RatecalculationrequestFromJson(
    Map<String, dynamic> json) {
  return Ratecalculationrequest()
    ..company_Margin = json['company_Margin'] as num
    ..company_FinalRate = json['company_FinalRate'] as num
    ..docketNo = json['docketNo'] as String
    ..bookingBranchId = json['bookingBranchId'] as num
    ..deliveryBranchId = json['deliveryBranchId'] as num
    ..oPADistance = json['oPADistance'] as num
    ..oDADistance = json['oDADistance'] as num
    ..actualWeight = json['actualWeight'] as num
    ..chargedWeight = json['chargedWeight'] as num
    ..qty = json['qty'] as num
    ..serviceTypeId = json['serviceTypeId'] as num
    ..paymentModeId = json['paymentModeId'] as num
    ..payeeId = json['payeeId'] as num
    ..partyRateCardId = json['partyRateCardId'] as num
    ..transportAsId = json['transportAsId'] as num
    ..fuelSurchargePercent = json['fuelSurchargePercent'] as num
    ..fovPercent = json['fovPercent'] as num
    ..consignorId = json['consignorId'] as num
    ..consigneeId = json['consigneeId'] as num
    ..totalInvoiceValue = json['totalInvoiceValue'] as num
    ..isCOD = json['isCOD'] as bool
    ..isDACC = json['isDACC'] as bool
    ..codValue = json['codValue'] as num
    ..pickupTypeId = json['pickupTypeId'] as num
    ..deliveryTypeId = json['deliveryTypeId'] as num
    ..consignorPincode = json['consignorPincode'] as num
    ..consigneePincode = json['consigneePincode'] as num
    ..miscCharge = json['miscCharge'] as num
    ..loadingCharge = json['loadingCharge'] as num
    ..unloadingCharge = json['unloadingCharge'] as num
    ..ftlRateCardChargesId = json['ftlRateCardChargesId'] as num;
}

Map<String, dynamic> _$RatecalculationrequestToJson(
        Ratecalculationrequest instance) =>
    <String, dynamic>{
      'company_Margin': instance.company_Margin,
      'company_FinalRate': instance.company_FinalRate,
      'docketNo': instance.docketNo,
      'bookingBranchId': instance.bookingBranchId,
      'deliveryBranchId': instance.deliveryBranchId,
      'oPADistance': instance.oPADistance,
      'oDADistance': instance.oDADistance,
      'actualWeight': instance.actualWeight,
      'chargedWeight': instance.chargedWeight,
      'qty': instance.qty,
      'serviceTypeId': instance.serviceTypeId,
      'paymentModeId': instance.paymentModeId,
      'payeeId': instance.payeeId,
      'partyRateCardId': instance.partyRateCardId,
      'transportAsId': instance.transportAsId,
      'fuelSurchargePercent': instance.fuelSurchargePercent,
      'fovPercent': instance.fovPercent,
      'consignorId': instance.consignorId,
      'consigneeId': instance.consigneeId,
      'totalInvoiceValue': instance.totalInvoiceValue,
      'isCOD': instance.isCOD,
      'isDACC': instance.isDACC,
      'codValue': instance.codValue,
      'pickupTypeId': instance.pickupTypeId,
      'deliveryTypeId': instance.deliveryTypeId,
      'consignorPincode': instance.consignorPincode,
      'consigneePincode': instance.consigneePincode,
      'miscCharge': instance.miscCharge,
      'loadingCharge': instance.loadingCharge,
      'unloadingCharge': instance.unloadingCharge,
      'ftlRateCardChargesId': instance.ftlRateCardChargesId
    };
