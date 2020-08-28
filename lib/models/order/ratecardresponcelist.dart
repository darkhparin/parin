import 'package:json_annotation/json_annotation.dart';
import "ratecardresponce.dart";
part 'ratecardresponcelist.g.dart';

@JsonSerializable()
class Ratecardresponcelist {
  Ratecardresponcelist();

  List<Ratecardresponce> ratecardlist;

  factory Ratecardresponcelist.fromJson(List json) =>
      _$RatecardresponcelistFromJson(json);
  Map<String, dynamic> toJson() => _$RatecardresponcelistToJson(this);
}
