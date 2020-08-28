import 'package:json_annotation/json_annotation.dart';
import "producttypeshort.dart";
import "pickupTypeshort.dart";
import "deliveryTypeshort.dart";
import "pincodeshort.dart";
part 'liablepartyresponce.g.dart';

@JsonSerializable()
class Liablepartyresponce {
    Liablepartyresponce();

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
    
    factory Liablepartyresponce.fromJson(Map<String,dynamic> json) => _$LiablepartyresponceFromJson(json);
    Map<String, dynamic> toJson() => _$LiablepartyresponceToJson(this);
}
