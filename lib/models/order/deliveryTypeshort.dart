import 'package:json_annotation/json_annotation.dart';

part 'deliveryTypeshort.g.dart';

@JsonSerializable()
class DeliveryTypeshort {
    DeliveryTypeshort();

    num deliveryTypeId;
    String deliveryType;
    
    factory DeliveryTypeshort.fromJson(Map<String,dynamic> json) => _$DeliveryTypeshortFromJson(json);
    Map<String, dynamic> toJson() => _$DeliveryTypeshortToJson(this);
}
