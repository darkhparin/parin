// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loadingTallyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadingTallyModel _$LoadingTallyModelFromJson(Map<String, dynamic> json) {
  return LoadingTallyModel()
    ..id = json['id'] as num
    ..tripRouteId = json['tripRouteId'] as num
    ..orderLegId = json['orderLegId'] as num
    ..packetLegId = json['packetLegId'] as num
    ..branchId = json['branchId'] as num
    ..branch = json['branch'] as String
    ..unloadingBranchId = json['unloadingBranchId'] as num
    ..unloadingBranch = json['unloadingBranch'] as String
    ..createdBy = json['createdBy'] as String
    ..createdOn = json['createdOn'] as String
    ..lastUpdatedBy = json['lastUpdatedBy'] as String
    ..lastUpdatedOn = json['lastUpdatedOn'] as String;
}

Map<String, dynamic> _$LoadingTallyModelToJson(LoadingTallyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tripRouteId': instance.tripRouteId,
      'orderLegId': instance.orderLegId,
      'packetLegId': instance.packetLegId,
      'branchId': instance.branchId,
      'branch': instance.branch,
      'unloadingBranchId': instance.unloadingBranchId,
      'unloadingBranch': instance.unloadingBranch,
      'createdBy': instance.createdBy,
      'createdOn': instance.createdOn,
      'lastUpdatedBy': instance.lastUpdatedBy,
      'lastUpdatedOn': instance.lastUpdatedOn
    };
