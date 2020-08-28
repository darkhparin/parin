import 'package:cwl/models/application/commonmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partyLocationDetailsModel.g.dart';

@JsonSerializable()
class PartyLocationDetailsModel {
  PartyLocationDetailsModel();

  Commonmodel state;
  Commonmodel city;
  List<Commonmodel> cityAreas;

  factory PartyLocationDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PartyLocationDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartyLocationDetailsModelToJson(this);
}
