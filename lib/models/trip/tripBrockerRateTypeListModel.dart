import 'package:json_annotation/json_annotation.dart';
import "tripBrockerRateTypeModel.dart";
part 'tripBrockerRateTypeListModel.g.dart';

@JsonSerializable()
class TripBrockerRateTypeListModel {
  TripBrockerRateTypeListModel();

  List<TripBrockerRateTypeModel> ratetypes;

  factory TripBrockerRateTypeListModel.fromJson(List json) =>
      _$TripBrockerRateTypeListModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripBrockerRateTypeListModelToJson(this);
}
