import 'package:json_annotation/json_annotation.dart';

part 'ewaybillextendrequest.g.dart';

@JsonSerializable()
class Ewaybillextendrequest {
    Ewaybillextendrequest();

    num eway_bill_number;
    String vehicle_number;
    num remaining_distance;
    String extend_validity_reason;
    String extend_remarks;
    String consignment_status;
    String transit_type;
    String address_line1;
    String address_line2;
    String address_line3;
    
    factory Ewaybillextendrequest.fromJson(Map<String,dynamic> json) => _$EwaybillextendrequestFromJson(json);
    Map<String, dynamic> toJson() => _$EwaybillextendrequestToJson(this);
}
