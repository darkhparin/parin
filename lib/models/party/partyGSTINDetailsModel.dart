import 'package:json_annotation/json_annotation.dart';

part 'partyGSTINDetailsModel.g.dart';

@JsonSerializable()
class PartyGSTINDetailsModel {
    PartyGSTINDetailsModel();

    String gstin;
    num gstStateId;
    String gstState;
    String partyName;
    String address;
    num pincode;
    bool isLocalGSTIN;
    
    factory PartyGSTINDetailsModel.fromJson(Map<String,dynamic> json) => _$PartyGSTINDetailsModelFromJson(json);
    Map<String, dynamic> toJson() => _$PartyGSTINDetailsModelToJson(this);
}
