import 'package:json_annotation/json_annotation.dart';
import "pincodeshort.dart";
part 'pincodeshortlist.g.dart';

@JsonSerializable()
class Pincodeshortlist {
  Pincodeshortlist();

  List<Pincodeshort> pincodes;

  factory Pincodeshortlist.fromJson(List json) =>
      _$PincodeshortlistFromJson(json);
  Map<String, dynamic> toJson() => _$PincodeshortlistToJson(this);
}
