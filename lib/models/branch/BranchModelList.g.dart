// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BranchModelList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModelList _$BranchModelListFromJson(List json) {
  return BranchModelList()
    ..branchList = json
        ?.map((e) =>
            e == null ? null : BranchModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BranchModelListToJson(BranchModelList instance) =>
    <String, dynamic>{'branchList': instance.branchList};
