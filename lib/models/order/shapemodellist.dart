import 'package:json_annotation/json_annotation.dart';
import "shapemodel.dart";
part 'shapemodellist.g.dart';

@JsonSerializable()
class Shapemodellist {
  Shapemodellist();

  List<Shapemodel> shapelist;

  factory Shapemodellist.fromJson(List json) => _$ShapemodellistFromJson(json);
  Map<String, dynamic> toJson() => _$ShapemodellistToJson(this);
}
