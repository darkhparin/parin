import 'package:json_annotation/json_annotation.dart';
import "commonmodel.dart";
part 'commonmodellist.g.dart';

@JsonSerializable()
class Commonmodellist {
  Commonmodellist();

  List<Commonmodel> commonlist;

  factory Commonmodellist.fromJson(List json) =>
      _$CommonmodellistFromJson(json);
  Map<String, dynamic> toJson() => _$CommonmodellistToJson(this);
}
