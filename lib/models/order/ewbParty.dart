import 'package:json_annotation/json_annotation.dart';
import "producttypeshort.dart";
import "pickupTypeshort.dart";
import "deliveryTypeshort.dart";
import "pincodeshort.dart";
part 'ewbParty.g.dart';

@JsonSerializable()
class EwbParty {
    EwbParty();

    num partyId;
    String name;
    String gstNo;
    bool isValidGSTIN;
    num creditPeriod;
    num billingCycleId;
    String billingCycle;
    Producttypeshort productType;
    PickupTypeshort pickupType;
    DeliveryTypeshort deliveryType;
    List<Pincodeshort> pincodes;
    
    factory EwbParty.fromJson(Map<String,dynamic> json) => _$EwbPartyFromJson(json);
    Map<String, dynamic> toJson() => _$EwbPartyToJson(this);
}
