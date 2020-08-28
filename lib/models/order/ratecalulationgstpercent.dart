import 'package:json_annotation/json_annotation.dart';

part 'ratecalulationgstpercent.g.dart';

@JsonSerializable()
class Ratecalulationgstpercent {
    Ratecalulationgstpercent();

    num cgst;
    num sgst;
    num ugst;
    num igst;
    
    factory Ratecalulationgstpercent.fromJson(Map<String,dynamic> json) => _$RatecalulationgstpercentFromJson(json);
    Map<String, dynamic> toJson() => _$RatecalulationgstpercentToJson(this);
}
