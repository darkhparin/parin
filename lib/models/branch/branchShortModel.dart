import 'package:json_annotation/json_annotation.dart';

part 'branchShortModel.g.dart';

@JsonSerializable()
class BranchShortModel {
    BranchShortModel();

    num branch_Id;
    String branch_Name;
    String branch_Code;
    
    factory BranchShortModel.fromJson(Map<String,dynamic> json) => _$BranchShortModelFromJson(json);
    Map<String, dynamic> toJson() => _$BranchShortModelToJson(this);
}
