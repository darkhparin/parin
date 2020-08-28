import 'package:json_annotation/json_annotation.dart';

part 'ratecardrequestmodel.g.dart';

@JsonSerializable()
class Ratecardrequestmodel {
    Ratecardrequestmodel();

    num userId;
    String bookingDate;
    num bookingBranchId;
    num deliveryBranchId;
    num consignorId;
    num consigneeId;
    num consignorPincode;
    num consigneePincode;
    num paymentPartyId;
    num servicetypeId;
    num paymentModeId;
    num transportAsId;
    
    factory Ratecardrequestmodel.fromJson(Map<String,dynamic> json) => _$RatecardrequestmodelFromJson(json);
    Map<String, dynamic> toJson() => _$RatecardrequestmodelToJson(this);
}
