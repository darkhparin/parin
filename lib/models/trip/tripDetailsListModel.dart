import 'package:json_annotation/json_annotation.dart';
import "tripDetailsModel.dart";
part 'tripDetailsListModel.g.dart';

@JsonSerializable()
class TripDetailsListModel {
  TripDetailsListModel();

  List<TripDetailsModel> tripdetailsList;

  factory TripDetailsListModel.fromJson(List json) =>
      _$TripDetailsListModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripDetailsListModelToJson(this);
}
