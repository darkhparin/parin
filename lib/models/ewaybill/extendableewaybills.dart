import 'package:json_annotation/json_annotation.dart';
import "extendableewaybill.dart";
part 'extendableewaybills.g.dart';

@JsonSerializable()
class Extendableewaybills {
  Extendableewaybills();

  List<Extendableewaybill> ewaybills;

  factory Extendableewaybills.fromJson(List json) =>
      _$ExtendableewaybillsFromJson(json);
  Map<String, dynamic> toJson() => _$ExtendableewaybillsToJson(this);
}
