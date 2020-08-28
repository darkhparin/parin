import 'package:json_annotation/json_annotation.dart';

part 'orderTrackingFullModelpd.g.dart';

@JsonSerializable()
class OrderTrackingFullModelpd {
    OrderTrackingFullModelpd();

    String packetNo;
    String packetDate;
    String packetStatus;
    String packetAckDate;
    String podPacketNo;
    String podPacketDate;
    String podPacketStatus;
    String podPacketAckDate;
    String codPacketNo;
    String codPacketDate;
    String codPacketStatus;
    String codPacketAckDate;
    
    factory OrderTrackingFullModelpd.fromJson(Map<String,dynamic> json) => _$OrderTrackingFullModelpdFromJson(json);
    Map<String, dynamic> toJson() => _$OrderTrackingFullModelpdToJson(this);
}
