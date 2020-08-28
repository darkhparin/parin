import 'package:json_annotation/json_annotation.dart';
import "branchShortModel.dart";
part 'branchShortListModel.g.dart';

@JsonSerializable()
class BranchShortListModel {
  BranchShortListModel();

  List<BranchShortModel> branchList;

  factory BranchShortListModel.fromJson(List json) =>
      _$BranchShortListModelFromJson(json);
  Map<String, dynamic> toJson() => _$BranchShortListModelToJson(this);
}
