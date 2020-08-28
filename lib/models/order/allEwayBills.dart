import 'package:json_annotation/json_annotation.dart';
import "allEwayBill.dart";
part 'allEwayBills.g.dart';

@JsonSerializable()
class AllEwayBills {
  AllEwayBills();

  List<AllEwayBill> allEwayBills;

  factory AllEwayBills.fromJson(List json) => _$AllEwayBillsFromJson(json);
  Map<String, dynamic> toJson() => _$AllEwayBillsToJson(this);
}
