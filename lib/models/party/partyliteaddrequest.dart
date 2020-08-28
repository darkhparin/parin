import 'package:json_annotation/json_annotation.dart';

part 'partyliteaddrequest.g.dart';

@JsonSerializable()
class Partyliteaddrequest {
    Partyliteaddrequest();

    num branchId;
    String partyname;
    num productTypeId;
    num marketingPersonId;
    String gstin;
    String address;
    num pincode;
    num stateId;
    num cityId;
    num cityAreaId;
    String contactPerson;
    String phoneM;
    String phoneO;
    num pickupTypeId;
    num deliveryTypeId;
    num employeeId;
    num userId;
    
    factory Partyliteaddrequest.fromJson(Map<String,dynamic> json) => _$PartyliteaddrequestFromJson(json);
    Map<String, dynamic> toJson() => _$PartyliteaddrequestToJson(this);
}
