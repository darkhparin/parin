import 'package:json_annotation/json_annotation.dart';

part 'cwlResultModel.g.dart';

@JsonSerializable()
class CwlResultModel {
    CwlResultModel();

    num id;
    bool hasError;
    String message;
    
    factory CwlResultModel.fromJson(Map<String,dynamic> json) => _$CwlResultModelFromJson(json);
    Map<String, dynamic> toJson() => _$CwlResultModelToJson(this);
}
