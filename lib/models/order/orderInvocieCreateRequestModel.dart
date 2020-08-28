import 'package:json_annotation/json_annotation.dart';

part 'orderInvocieCreateRequestModel.g.dart';

@JsonSerializable()
class OrderInvocieCreateRequestModel {
    OrderInvocieCreateRequestModel();

    num orderId;
    String mobile;
    String email;
    bool hasEmailAlert;
    bool hasSmsAlert;
    
    factory OrderInvocieCreateRequestModel.fromJson(Map<String,dynamic> json) => _$OrderInvocieCreateRequestModelFromJson(json);
    Map<String, dynamic> toJson() => _$OrderInvocieCreateRequestModelToJson(this);
}
