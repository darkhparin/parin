import 'package:json_annotation/json_annotation.dart';
import "BranchModel.dart";
part 'BranchModelList.g.dart';

@JsonSerializable()
class BranchModelList {
  BranchModelList();

  List<BranchModel> branchList;

  factory BranchModelList.fromJson(List json) =>
      _$BranchModelListFromJson(json);
  Map<String, dynamic> toJson() => _$BranchModelListToJson(this);
}
