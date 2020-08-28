import 'package:json_annotation/json_annotation.dart';
import "tripTypeModel.dart";
part 'tripTypeListModel.g.dart';

@JsonSerializable()
class TripTypeListModel {
  TripTypeListModel();

  List<TripTypeModel> tripTypes;

  factory TripTypeListModel.fromJson(List json) =>
      _$TripTypeListModelFromJson(json);
  Map<String, dynamic> toJson() => _$TripTypeListModelToJson(this);
}
