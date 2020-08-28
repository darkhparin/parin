import 'package:json_annotation/json_annotation.dart';

part 'tripRouteModel.g.dart';

@JsonSerializable()
class TripRouteModel {
  TripRouteModel();

  num id;
  num tripId;
  num branchId;
  String branch;
  String branchColor;
  num seqNo;
  String seqNoColor;
  String arrivalTime;
  String departureTime;
  bool canPlan;
  bool canAddAbove;
  bool canAddBelove;
  bool isSelectable;
  String standBy;
  bool isFirst;
  bool isLast;
  String sealNo;
  String unSealNo;
  num statusId;
  String status;
  String remark;
  num arrivalReading;
  bool isEnable;
  bool isEnableConsolidateWaybill;
  num latitude;
  num longitude;

  factory TripRouteModel.fromJson(Map<String, dynamic> json) =>
      _$TripRouteModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripRouteModelToJson(this);
}
