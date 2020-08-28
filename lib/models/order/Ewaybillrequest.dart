import 'package:json_annotation/json_annotation.dart';

part 'Ewaybillrequest.g.dart';

@JsonSerializable()
class Ewaybillrequest {
    Ewaybillrequest();

    List ewayBills;
    num bookingBranchId;
    num deliveryPincode;
    
    factory Ewaybillrequest.fromJson(Map<String,dynamic> json) => _$EwaybillrequestFromJson(json);
    Map<String, dynamic> toJson() => _$EwaybillrequestToJson(this);
}
