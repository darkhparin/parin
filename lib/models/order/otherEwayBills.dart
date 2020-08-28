import 'package:json_annotation/json_annotation.dart';
import "allEwayBill.dart";
part 'otherEwayBills.g.dart';

@JsonSerializable()
class OtherEwayBills {
    OtherEwayBills();

    AllEwayBill otherEwayBills;
    
    factory OtherEwayBills.fromJson(Map<String,dynamic> json) => _$OtherEwayBillsFromJson(json);
    Map<String, dynamic> toJson() => _$OtherEwayBillsToJson(this);
}
