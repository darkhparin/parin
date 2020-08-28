import 'package:json_annotation/json_annotation.dart';

part 'orderTrackingFullModeltsd.g.dart';

@JsonSerializable()
class OrderTrackingFullModeltsd {
  OrderTrackingFullModeltsd();

  num sequenceNr;
  String fromStation;
  String toStation;
  String dispatchDate;
  String arrivalDate;
  num qty;
  num weight;
  String trip;
  String vehicle;
  int onHoldHours;

  factory OrderTrackingFullModeltsd.fromJson(Map<String, dynamic> json) =>
      _$OrderTrackingFullModeltsdFromJson(json);
  Map<String, dynamic> toJson() => _$OrderTrackingFullModeltsdToJson(this);
}
