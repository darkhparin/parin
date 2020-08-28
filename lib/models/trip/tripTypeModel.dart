import 'package:json_annotation/json_annotation.dart';

part 'tripTypeModel.g.dart';

@JsonSerializable()
class TripTypeModel {
    TripTypeModel();

    num id;
    String type;
    
    factory TripTypeModel.fromJson(Map<String,dynamic> json) => _$TripTypeModelFromJson(json);
    Map<String, dynamic> toJson() => _$TripTypeModelToJson(this);
}
