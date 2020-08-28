// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordersaverequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ordersaverequest _$OrdersaverequestFromJson(Map<String, dynamic> json) {
  return Ordersaverequest()
    ..userId = json['userId'] as num
    ..deviceTypeId = json['deviceTypeId'] as num
    ..docketNo = json['docketNo'] as String
    ..bookingBranchId = json['bookingBranchId'] as num
    ..deliveryBranchId = json['deliveryBranchId'] as num
    ..consignorId = json['consignorId'] as num
    ..consigneeId = json['consigneeId'] as num
    ..liablePartyId = json['liablePartyId'] as num
    ..bookingDate = json['bookingDate'] as String
    ..bookingTime = json['bookingTime'] as String
    ..rateCardCharges = json['rateCardCharges'] == null
        ? null
        : Ratecardcharges.fromJson(
            json['rateCardCharges'] as Map<String, dynamic>)
    ..paymentModeId = json['paymentModeId'] as num
    ..serviceTypeId = json['serviceTypeId'] as num
    ..transportAsId = json['transportAsId'] as num
    ..docketRemark = json['docketRemark'] as String
    ..ewayBills = (json['ewayBills'] as List)
        ?.map((e) =>
            e == null ? null : Ewaybillcore.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..vendorId = json['vendorId'] as num
    ..orderCharges = json['orderCharges'] == null
        ? null
        : Ratecalculationresponce.fromJson(
            json['orderCharges'] as Map<String, dynamic>)
    ..partyRateCardId = json['partyRateCardId'] as num
    ..rateCardId = json['rateCardId'] as num
    ..hasCOD = json['hasCOD'] as bool
    ..hasDACC = json['hasDACC'] as bool
    ..newRate = json['newRate'] as num
    ..collectionTypeId = json['collectionTypeId'] as num
    ..verifyAtSave = json['verifyAtSave'] as bool
    ..pickUpLoaction = json['pickUpLoaction'] == null
        ? null
        : Locationmodel.fromJson(json['pickUpLoaction'] as Map<String, dynamic>)
    ..deliveryLocation = json['deliveryLocation'] == null
        ? null
        : Locationmodel.fromJson(
            json['deliveryLocation'] as Map<String, dynamic>)
    ..orderLines = (json['orderLines'] as List)
        ?.map((e) => e == null
            ? null
            : Orderlineresponce.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..isAccountCopyVerified = json['isAccountCopyVerified'] as bool
    ..accountCopyFilePath = json['accountCopyFilePath'] as String
    ..accountCopyVerifiedBy = json['accountCopyVerifiedBy'] as num;
}

Map<String, dynamic> _$OrdersaverequestToJson(Ordersaverequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'deviceTypeId': instance.deviceTypeId,
      'docketNo': instance.docketNo,
      'bookingBranchId': instance.bookingBranchId,
      'deliveryBranchId': instance.deliveryBranchId,
      'consignorId': instance.consignorId,
      'consigneeId': instance.consigneeId,
      'liablePartyId': instance.liablePartyId,
      'bookingDate': instance.bookingDate,
      'bookingTime': instance.bookingTime,
      'rateCardCharges': instance.rateCardCharges,
      'paymentModeId': instance.paymentModeId,
      'serviceTypeId': instance.serviceTypeId,
      'transportAsId': instance.transportAsId,
      'docketRemark': instance.docketRemark,
      'ewayBills': instance.ewayBills,
      'vendorId': instance.vendorId,
      'orderCharges': instance.orderCharges,
      'partyRateCardId': instance.partyRateCardId,
      'rateCardId': instance.rateCardId,
      'hasCOD': instance.hasCOD,
      'hasDACC': instance.hasDACC,
      'newRate': instance.newRate,
      'collectionTypeId': instance.collectionTypeId,
      'verifyAtSave': instance.verifyAtSave,
      'pickUpLoaction': instance.pickUpLoaction,
      'deliveryLocation': instance.deliveryLocation,
      'orderLines': instance.orderLines,
      'isAccountCopyVerified': instance.isAccountCopyVerified,
      'accountCopyFilePath': instance.accountCopyFilePath,
      'accountCopyVerifiedBy': instance.accountCopyVerifiedBy
    };
