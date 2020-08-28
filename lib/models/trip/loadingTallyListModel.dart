import 'package:json_annotation/json_annotation.dart';
import "loadingTallyModel.dart";
part 'loadingTallyListModel.g.dart';

@JsonSerializable()
class LoadingTallyListModel {
  LoadingTallyListModel();

  List<LoadingTallyModel> tally;

  factory LoadingTallyListModel.fromJson(List json) =>
      _$LoadingTallyListModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoadingTallyListModelToJson(this);
}
