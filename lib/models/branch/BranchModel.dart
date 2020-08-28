import 'package:json_annotation/json_annotation.dart';

part 'BranchModel.g.dart';

@JsonSerializable()
class BranchModel {
    BranchModel();

    num id;
    String code;
    String name;
    String branch;
    bool isDepot;
    String openingDate;
    String closingDate;
    String phone_O;
    String phone_M;
    bool isDeleted;
    String email;
    bool isActive;
    bool isClosed;
    String contactPerson;
    num branchLocation_Id;
    String zone;
    num perKgRate;
    num regionalManager_Id;
    num zonalManager_Id;
    num maxSurfacePercent;
    num maxAirPercent;
    num maxRailPercent;
    num maxFTLPercent;
    num demurrageHours;
    num demurrageRate;
    num gstCompanyStateId;
    num latitude;
    num longitude;
    String region;
    num zoneId;
    
    factory BranchModel.fromJson(Map<String,dynamic> json) => _$BranchModelFromJson(json);
    Map<String, dynamic> toJson() => _$BranchModelToJson(this);
}
