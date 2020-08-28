import 'package:json_annotation/json_annotation.dart';

part 'orderTrackingFullModelod.g.dart';

@JsonSerializable()
class OrderTrackingFullModelod {
    OrderTrackingFullModelod();

    String documentName;
    String fileName;
    String fileDate;
    num documentId;
    
    factory OrderTrackingFullModelod.fromJson(Map<String,dynamic> json) => _$OrderTrackingFullModelodFromJson(json);
    Map<String, dynamic> toJson() => _$OrderTrackingFullModelodToJson(this);
}
