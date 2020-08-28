// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branchShortModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchShortModel _$BranchShortModelFromJson(Map<String, dynamic> json) {
  return BranchShortModel()
    ..branch_Id = json['branch_Id'] as num
    ..branch_Name = json['branch_Name'] as String
    ..branch_Code = json['branch_Code'] as String;
}

Map<String, dynamic> _$BranchShortModelToJson(BranchShortModel instance) =>
    <String, dynamic>{
      'branch_Id': instance.branch_Id,
      'branch_Name': instance.branch_Name,
      'branch_Code': instance.branch_Code
    };
