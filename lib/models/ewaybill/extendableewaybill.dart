import 'package:json_annotation/json_annotation.dart';

part 'extendableewaybill.g.dart';

@JsonSerializable()
class Extendableewaybill {
    Extendableewaybill();

    num ewayBillId;
    String docketNo;
    String fromBranch;
    String toBranch;
    String status;
    num ewbNo;
    String createdOn;
    String validTill;
    num validDays;
    num extendedTimes;
    num expireIn;
    
    factory Extendableewaybill.fromJson(Map<String,dynamic> json) => _$ExtendableewaybillFromJson(json);
    Map<String, dynamic> toJson() => _$ExtendableewaybillToJson(this);
}
