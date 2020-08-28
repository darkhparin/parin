import 'package:json_annotation/json_annotation.dart';
import "ratecardcharges.dart";
import "ratecalulationgstpercent.dart";
part 'ratecalculationresponce.g.dart';

@JsonSerializable()
class Ratecalculationresponce {
    Ratecalculationresponce();

    num cwlCost;
    num cwlMargin;
    num rate;
    num actualWeight;
    num totalChargableWeight;
    num totalQty;
    num totalActualWeight;
    num minmumCharges;
    num firstFreight;
    num chargableFreight;
    num fuelSurchargePercent;
    num org_FuelSurchargePercent;
    num fuelSurcharge;
    num docketCharge;
    num org_DocketCharge;
    num podCharge;
    num org_PODCharge;
    num fodCharge;
    num fovPercentage;
    num org_FOVPercentage;
    num fovCharge;
    num org_FOVCharge;
    bool hasCOD;
    bool hasDACC;
    num daccCharge;
    String daccRemark;
    num daccPercentage;
    num codCharge;
    num codValue;
    num codPercent;
    num opaCharge;
    num odaCharge;
    num org_OPACharge;
    num org_ODACharge;
    num miscCharge;
    num org_MiscCharge;
    num loadingCharges;
    num unLoadingCharges;
    num org_LoadingCharges;
    num org_UnLoadingCharges;
    num costExcludingTax;
    num igst;
    num ugst;
    num cgst;
    num sgst;
    num totalCharge;
    Ratecardcharges rateCardCharges;
    Ratecalulationgstpercent gstPercent;
    
    factory Ratecalculationresponce.fromJson(Map<String,dynamic> json) => _$RatecalculationresponceFromJson(json);
    Map<String, dynamic> toJson() => _$RatecalculationresponceToJson(this);
}
