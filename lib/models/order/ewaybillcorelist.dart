import 'package:json_annotation/json_annotation.dart';
import "ewaybillcore.dart";
part 'ewaybillcorelist.g.dart';

@JsonSerializable()
class Ewaybillcorelist {
  Ewaybillcorelist();

  List<Ewaybillcore> ewaybillcorelist;

  factory Ewaybillcorelist.fromJson(List json) =>
      _$EwaybillcorelistFromJson(json);
  Map<String, dynamic> toJson() => _$EwaybillcorelistToJson(this);
}
