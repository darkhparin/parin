// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branchShortListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchShortListModel _$BranchShortListModelFromJson(List json) {
  return BranchShortListModel()
    ..branchList = json
        ?.map((e) => e == null
            ? null
            : BranchShortModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BranchShortListModelToJson(
        BranchShortListModel instance) =>
    <String, dynamic>{'branchList': instance.branchList};
