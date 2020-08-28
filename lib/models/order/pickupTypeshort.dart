import 'package:json_annotation/json_annotation.dart';

part 'pickupTypeshort.g.dart';

@JsonSerializable()
class PickupTypeshort {
    PickupTypeshort();

    num pickUpTypeId;
    String pickUpType;
    
    factory PickupTypeshort.fromJson(Map<String,dynamic> json) => _$PickupTypeshortFromJson(json);
    Map<String, dynamic> toJson() => _$PickupTypeshortToJson(this);
}
