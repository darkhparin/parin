import 'package:json_annotation/json_annotation.dart';

part 'ewayBillRawRequestModel.g.dart';

@JsonSerializable()
class EwayBillRawRequestModel {
  EwayBillRawRequestModel();

  List<num> ewayBills;

  factory EwayBillRawRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EwayBillRawRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$EwayBillRawRequestModelToJson(this);
}
