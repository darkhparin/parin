import 'package:json_annotation/json_annotation.dart';

part 'ratecardchargesrequest.g.dart';

@JsonSerializable()
class Ratecardchargesrequest {
    Ratecardchargesrequest();

    num ratecardId;
    bool isDefault;
    num oPACard_Id;
    num oDACard_Id;
    num opadistance;
    num odadistance;
    num serviceTypeId;
    num transportAsId;
    num bookingBranchId;
    num deliveryBranchId;
    
    factory Ratecardchargesrequest.fromJson(Map<String,dynamic> json) => _$RatecardchargesrequestFromJson(json);
    Map<String, dynamic> toJson() => _$RatecardchargesrequestToJson(this);
}
