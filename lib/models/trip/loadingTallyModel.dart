import 'package:json_annotation/json_annotation.dart';

part 'loadingTallyModel.g.dart';

@JsonSerializable()
class LoadingTallyModel {
    LoadingTallyModel();

    num id;
    num tripRouteId;
    num orderLegId;
    num packetLegId;
    num branchId;
    String branch;
    num unloadingBranchId;
    String unloadingBranch;
    String createdBy;
    String createdOn;
    String lastUpdatedBy;
    String lastUpdatedOn;
    
    factory LoadingTallyModel.fromJson(Map<String,dynamic> json) => _$LoadingTallyModelFromJson(json);
    Map<String, dynamic> toJson() => _$LoadingTallyModelToJson(this);
}
