import 'package:json_annotation/json_annotation.dart';

part 'orderInvoiceConfirmationModel.g.dart';

@JsonSerializable()
class OrderInvoiceConfirmationModel {
    OrderInvoiceConfirmationModel();

    num orderId;
    String partyName;
    String mobile;
    String email;
    bool hasEmailAlert;
    bool hasSmsAlert;
    num igst;
    num sgst;
    num cgst;
    num amount;
    
    factory OrderInvoiceConfirmationModel.fromJson(Map<String,dynamic> json) => _$OrderInvoiceConfirmationModelFromJson(json);
    Map<String, dynamic> toJson() => _$OrderInvoiceConfirmationModelToJson(this);
}
