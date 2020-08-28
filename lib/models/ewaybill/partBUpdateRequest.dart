import 'package:json_annotation/json_annotation.dart';

part 'partBUpdateRequest.g.dart';

@JsonSerializable()
class PartBUpdateRequest {
    PartBUpdateRequest();

    num eway_bill_number;
    String vehicle_number;
    String transporter_document_number;
    
    factory PartBUpdateRequest.fromJson(Map<String,dynamic> json) => _$PartBUpdateRequestFromJson(json);
    Map<String, dynamic> toJson() => _$PartBUpdateRequestToJson(this);
}
