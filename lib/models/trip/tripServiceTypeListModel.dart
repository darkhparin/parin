import 'package:json_annotation/json_annotation.dart';
import "tripServiceTypeModel.dart";
part 'tripServiceTypeListModel.g.dart';

@JsonSerializable()
class TripServiceTypeListModel {
  TripServiceTypeListModel();

  List<TripServiceTypeModel> servicetypes;

  factory TripServiceTypeListModel.fromJson(List json) =>
      _$TripServiceTypeListModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripServiceTypeListModelToJson(this);
}
