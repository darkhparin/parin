import 'package:json_annotation/json_annotation.dart';
import "ratecardcharges.dart";
import "opdacharges.dart";
part 'ratecardcchargesresponce.g.dart';

@JsonSerializable()
class Ratecardcchargesresponce {
    Ratecardcchargesresponce();

    num company_Cost;
    num company_Margin_Act;
    num company_Margin;
    num company_FinalRate;
    List<Ratecardcharges> rateCardCharges;
    List<Opdacharges> opaCardCharges;
    List<Opdacharges> odaCardCharges;
    
    factory Ratecardcchargesresponce.fromJson(Map<String,dynamic> json) => _$RatecardcchargesresponceFromJson(json);
    Map<String, dynamic> toJson() => _$RatecardcchargesresponceToJson(this);
}
